if !executable(expand("$HOME/.rbenv/shims/solargraph"))
  echom "Please install solargraph to ~/.rbenv/shims/solargraph (gem install solargraph) and then execute 'solargraph download-core'"
endif

let g:LanguageClient_serverCommands = {
  \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
  \ 'rspec': ['~/.rbenv/shims/solargraph', 'stdio'],
  \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
  \ 'svelte': ['/usr/local/bin/javascript-typescript-stdio'],
\ }

let g:LanguageClient_rootMarkers = {
  \ 'ruby': ['Gemfile'],
  \ 'rspec': ['Gemfile'],
  \ 'javascript': ['package.json'],
\ }

let g:LanguageClient_hasSnippetSupport = 1

" Goto definition
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Hoverhelp
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Big menu
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
