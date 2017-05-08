" 
" TypeScript support
"

" Only load plugin on vim 7.04+
if v:version < 704
  let g:loaded_tsuquyomi=1
endif

" use local typescript
let g:tsuquyomi_use_local_typescript=1
let g:tsuquyomi_use_dev_node_module=2
let g:tsuquyomi_tsserver_path = 'node_modules/.bin/tsserver'

" Ignore Cannot find module '@angular/platform-browser-dynamic/testing'. [typescript/tsuquyomi]
let g:tsuquyomi_ignore_missing_modules = 1

" use syntastic
let g:tsuquyomi_disable_quickfix = 1

" Use shortest path import
let g:tsuquyomi_shortest_import_path = 1

" use vimproc because its faster
let g:tsuquyomi_use_vimproc = 1
