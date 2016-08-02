" TypeScript support

" Only load plugin on vim 7.04+
if v:version < 704
  let g:loaded_tsuquyomi=1
endif

" use local typescript
let g:tsuquyomi_use_local_typescript=1

" use syntastic
let g:tsuquyomi_disable_quickfix = 1

let g:tsuquyomi_tsserver_path = 'node_modules/typescript/bin/tsserver'
