" Supertab config

" First try context sensitive completion then fallback to 
" local file complete 
let g:SuperTabContextDefaultCompletionType = "<C-x><C-n>"

" map supertab to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" prefer omni-completion
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" First try omni-complete then local completion
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<C-x><C-n>") |
  \   call SuperTabSetDefaultCompletionType("context") |
  \ endif
