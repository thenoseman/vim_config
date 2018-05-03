" Set Ruby-specific config

augroup vim_config
  autocmd FileType ruby call ConfigureRubyFileType()
  autocmd FileType eruby call ConfigureRubyFileType()
  autocmd FileType haml  call ConfigureRubyFileType()
  autocmd FileType yaml  call ConfigureRubyFileType()

  " On write just update tags of this file
  autocmd BufWritePost *.rb call writefile(split(system("sort -u <(touch tags && grep -v " . expand('%:%') . " tags) <(ripper-tags --exclude=vendor --exclude=log --exclude=tmp --exclude=testapp -f - " . shellescape(expand('%:%')) . " | grep " . expand('%:r') . ")"),"\n"),"tags")

  " Specs can be named _scene.rb (integration tests)
  autocmd BufReadPost,BufNewFile *_scene.rb set ft=rspec | set syntax=rspec | call ConfigureRubyFileType()
  autocmd BufReadPost,BufNewFile *_spec.rb set ft=rspec | set syntax=rspec | call ConfigureRubyFileType()

  " These files are also Ruby.
  autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby
augroup END

fun! ConfigureRubyFileType()
   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable

   " No stinkin' popup
   if has('gui_running')
     set noballooneval
   endif

  " see https://code.google.com/p/vim/issues/detail?id=282
  set regexpengine=1
  set lazyredraw

  " gd => jump to definition (ctags based)
  nmap <buffer> gd <c-]><cr> 

  " Extend the default ruby matchit to include the rspec verbs
  let b:match_words =
	\ '\<\%(if\|unless\|case\|while\|until\|for\|do\|class\|module\|def\|begin\)\>=\@!' .
	\ ':' .
	\ '\<\%(else\|elsif\|ensure\|when\|rescue\|break\|redo\|next\|retry\)\>' .
	\ ':' .
        \ '\%(^\|[^.\:@$]\)\@<=\<end\:\@!\>' .
	\ ',{:},\[:\],(:)'
endfun
