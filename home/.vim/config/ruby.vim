""""""""""""""""""""""""""""""""
"" Set Ruby-specific keybindings
""""""""""""""""""""""""""""""""

autocmd FileType ruby  call LoadRubyKeybindings()
autocmd FileType eruby call LoadRubyKeybindings()
autocmd FileType haml  call LoadRubyKeybindings()
autocmd FileType yaml  call LoadRubyKeybindings()

fun! LoadRubyKeybindings()
   " bind control-l to hashrocket
   imap <buffer> <C-l> <Space>=><Space>"

   " bind control-k to turn the current word into a symbol
   imap <buffer> <C-k> <C-o>b:<Esc>Ea
   nmap <buffer> <C-k> lbi:<Esc>E

   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable
endfun

" :Gp changes gem 'hello' to gem 'hello', :path => '../hello'
" Another :Gp changes it back
fun! RubyGemfilePathLocal()
  let line = getline(".")
  if match(line, ":path") != -1
    let repl = substitute(line, ', *:path.*$', "", "g")
    call setline(".", repl)
  else
    normal ^^wl"ayiwA, :path => "../"apA
  endif
endfun
command! Gp call RubyGemfilePathLocal()

" These files are also Ruby.
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby

" Specs can be name _scene.rb
autocmd BufRead,BufNewFile *_scene.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subjectits shared_examples_for shared_context let | highlight def link rubyRspec Function
