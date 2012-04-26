" Supertab config

" First try context sensitive completion than fallbck to ever great
" omni-complete 
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"

" map supertab to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
