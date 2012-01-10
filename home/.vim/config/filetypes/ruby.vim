""""""""""""""""""""""""""""""""
"" Set Ruby-specific keybindings
""""""""""""""""""""""""""""""""

autocmd FileType ruby  call LoadRubyKeybindings()
autocmd FileType eruby call LoadRubyKeybindings()
autocmd FileType haml  call LoadRubyKeybindings()
autocmd FileType yaml  call LoadRubyKeybindings()
autocmd FileType ruby  call AddMagicEncodingComment()

fun! LoadRubyKeybindings()
   " @key <C-k>: Turn current word into a symbol (normal and insert mode)
   imap <buffer> <C-k> <C-o>b:<Esc>Ea
   nmap <buffer> <C-k> lbi:<Esc>E

   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable
endfun

" These files are also Ruby.
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby

" Specs can be named _scene.rb
autocmd BufRead,BufNewFile *_scene.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subjectits shared_examples_for shared_context let | highlight def link rubyRspec Function
