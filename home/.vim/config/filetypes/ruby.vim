" Set Ruby-specific config

augroup vim_config
  autocmd FileType ruby call ConfigureRubyFileType()
  autocmd FileType eruby call ConfigureRubyFileType()
  autocmd FileType haml  call ConfigureRubyFileType()
  autocmd FileType yaml  call ConfigureRubyFileType()

  " On enter update/create tags
  autocmd VimEnter * call UpdateOrCreateTagsFile()

  " On write just update tags of this file
  autocmd BufWritePost *.rb call writefile(split(system("sort -u <(touch tags && grep -v " . expand('%:%') . " tags) <(/usr/local/bin/ctags --languages=ruby -u -f - " . shellescape(expand('%:%')) . " | grep " . expand('%:r') . ")"),"\n"),"tags")

  " Specs can be named _scene.rb (integration tests)
  autocmd BufReadPost,BufNewFile *_scene.rb set syntax=rspec | call ConfigureRubyFileType()

  " These files are also Ruby.
  autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby

  " Add frozen string literal to each file
  autocmd BufRead,BufNewFile *.rb call AddTextToTopIfMissing("# frozen_string_literal: true","frozen_string_literal")
augroup END

fun! ConfigureRubyFileType()
   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable

   " No stinkin' popup
   if has("gui_running")
     set noballooneval
   endif

  " see https://code.google.com/p/vim/issues/detail?id=282
  set regexpengine=1
  set lazyredraw

  " gd => jump to definition (ctags based)
  nmap <buffer> gd <c-]><cr> 
endfun

" Create tags file (if it doesn't exist)
" or update tags file if it is too old
fun! UpdateOrCreateTagsFile()
  let mtime_tags = getftime("tags")
  let mtime_gemfile = getftime("Gemfile.lock")

  if mtime_gemfile > 0 && (mtime_tags == -1 || mtime_gemfile > mtime_tags)
    echom "Generating tags as Gemfile.lock is newer than tags"
    silent! execute ":!(/usr/local/bin/ctags -R --languages=ruby -u -f tags) &"
  endif
endfun
