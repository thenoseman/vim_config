" TypeScript support

" Only load plugin on vim 7.04+
if v:version < 704
  let g:loaded_tsuquyomi=1
endif

" use global typescript
let g:tsuquyomi_use_local_typescript=0

" use syntastic
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
