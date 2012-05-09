" Supertab config

" First try context sensitive completion then fallback to 
" local file complete 
let g:SuperTabContextDefaultCompletionType = "<C-x><C-n>"

" map supertab to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" prefer omni-completion
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" pre-highlight the first match
let g:SuperTabLongestHighlight = 1

" attempt to close vim's completion preview window
" when the completion popup closes
let g:SuperTabClosePreviewOnPopupClose = 1

" First try omni-complete then local completion
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<C-x><C-n>") |
      \   call SuperTabSetDefaultCompletionType("context") |
      \ endif

function MyTagContext()
  if filereadable(expand('%:p:h') . '/tags')
    echo "AAAA"
    return "\<c-x>\<c-]>"
  endif
  " no return will result in the evaluation of the next
  " configured context
endfunction
"let g:SuperTabCompletionContexts = ['MyTagContext', 's:ContextText', 's:ContextDiscover']
