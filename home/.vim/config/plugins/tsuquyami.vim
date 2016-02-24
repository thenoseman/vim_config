" TypeScript support

" Only load plugin on vim 7.04+
if v:version < 704
  let g:loaded_tsuquyomi=!
endif

" use global typescript
let g:tsuquyomi_use_local_typescript=0
