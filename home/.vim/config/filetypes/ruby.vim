""""""""""""""""""""""""""""""""
"" Set Ruby-specific keybindings
""""""""""""""""""""""""""""""""

augroup vim_config
  autocmd FileType ruby call LoadRubyKeybindings()
  autocmd FileType eruby call LoadRubyKeybindings()
  autocmd FileType haml call LoadRubyKeybindings()
  autocmd FileType yaml call LoadRubyKeybindings()

  " Automatically add magic encoding comment
  autocmd FileType ruby call AddMagicEncodingComment()

  " On enter update/create tags
  autocmd VimEnter * call UpdateOrCreateTagsFile()

  " On write just update tags of this file
  autocmd BufWritePost *.rb call writefile(split(system("sort -u <(touch tags && grep -v " . expand('%:%') . " tags) <(ctags --languages=ruby -u -f - " . shellescape(expand('%:%')) . " | grep " . expand('%:r') . ")"),"\n"),"tags")

  " Specs can be named _scene.rb
  autocmd BufRead,BufNewFile *_scene.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subjectits shared_examples_for shared_context let | highlight def link rubyRspec Function

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
   if has("gui")
     set noballooneval
   endif
endfun

" remove should in rspec specs
" it "should use no should"
" it "should not use should"
" it "shouldn't use should"
" it "should be should-less"
" it "should not be littered with should's"
" it "should have fun being without should"
" it "should not have should's"
" it "should silenty kill should's"
" it "should display the shoulds"
" it "should pass this test"
fun! Unshouldify()
  silent! %s/\v (["'])(should not|shouldn't)/ \1doesn't/gi
  silent! %s/\v (["'])should have/ \1has/gi
  silent! %s/\v (["'])should be/ \1is/gi
  silent! %s/\v (["'])doesn't be/ \1isn't/gi
  silent! %s/\v (["'])should display/ \1displays/gi
  silent! %s/\v (["'])should ([^ ]+y) ([^ ]+)/ \1\2 \3s/gi
  silent! %s/\v (["'])should ([^ ]+)/ \1\2s/gi
  silent! %s/\v (["'])(.{-})sss/ \1\2sses/gi
  silent! %s/\v 'isn't/'is not/gi
endfun
com! Unshouldify call Unshouldify()

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

" Looks up locales in config/locales
" works with t("a.b.c") or t('a.b.c')
fun! RailsLocaleLookup()
  let s:oldpos = getpos(".")
  let s:locale_string = ""
  let s:match_end = search("[\"']","e", line("."))
  if s:match_end > 0
    let s:match_end = col(".")-2
    let s:match_start = search("[\"']","eb", line("."))
    if s:match_start > 0 
      let s:match_start = col(".")
      let s:locale_string = getline(".")[s:match_start : s:match_end]
    endif
  endif

  if s:locale_string != ""
    let s:grep_term = substitute(s:locale_string, "\\.", ":\\\\_.*", "g")
    execute ":1vimgrep! /" . s:grep_term . "/j config/locales/*.yml" 
    let s:locale_hits = getqflist()
    if len(s:locale_hits) > 0
      let s:source_file = bufname(s:locale_hits[0].bufnr)
      let s:source_line = s:locale_hits[0].lnum
      silent! execute "e +" . s:source_line . " " . s:source_file
      let s:nirvana = search(s:grep_term, "e", line("$"))
      nohl
    else
      redraw
      echon "Locale entry '" . s:locale_string . "' could not be found in config/locales/*.yml"
    endif
  else
    redraw
    echon "No locale string (format a.b.c) found under cursor!"
  endif
endfunction

command! Loc call RailsLocaleLookup() 
