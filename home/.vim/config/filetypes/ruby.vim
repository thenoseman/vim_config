" Set Ruby-specific keybindings

augroup vim_config
  autocmd FileType ruby  call LoadRubyKeybindings()
  autocmd FileType eruby call LoadRubyKeybindings()
  autocmd FileType haml  call LoadRubyKeybindings()
  autocmd FileType yaml  call LoadRubyKeybindings()

  " Automatically add magic encoding comment
  autocmd BufRead,BufNewFile *.rb call AddTextToTopIfMissing("# -*- encoding : utf-8 -*-","encoding[ ]\+:[ ]\+utf-8")

  " On enter update/create tags
  autocmd VimEnter * call UpdateOrCreateTagsFile()

  " On write just update tags of this file
  autocmd BufWritePost *.rb call writefile(split(system("sort -u <(touch tags && grep -v " . expand('%:%') . " tags) <(ctags --languages=ruby -u -f - " . shellescape(expand('%:%')) . " | grep " . expand('%:r') . ")"),"\n"),"tags")

  " Specs can be named _scene.rb
  autocmd BufRead,BufNewFile *_scene.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let | highlight def link rubyRspec Function

  " These files are also Ruby.
  autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby
augroup END

fun! LoadRubyKeybindings()
   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable

   " No stinkin' popup
   if has("gui_running")
     set noballooneval
   endif
endfun

" Create tags file (if it doesn't exist)
" or update tags file if it is too old
fun! UpdateOrCreateTagsFile()
  let mtime_tags = getftime("tags")
  let mtime_gemfile = getftime("Gemfile.lock")

  if mtime_gemfile > 0 && (mtime_tags == -1 || mtime_gemfile > mtime_tags)
    echom "Generating tags as Gemfile.lock is newer than tags"
    let tempfile = tempname()
    call writefile(["#!/bin/bash","ctags -R --languages=ruby -u -f tags", "rm $0"], tempfile)
    silent! execute ":!bash " . tempfile . " &"
  endif
endfun
