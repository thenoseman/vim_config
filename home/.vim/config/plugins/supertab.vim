" Supertab config

" First try context sensitive completion than fallbck to ever great
" omni-complete 
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"

" map supertab to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" First try omni-complete then local completion
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<C-X><C-P>") |
  \   call SuperTabSetDefaultCompletionType("context") |
  \ endif
