" Supertab config

" First try context sensitive completion then
" fal back to  keyword local completion if nothing found
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-x><C-n>"

" map completion to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" prefer omni-completion
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" pre-highlight the first match
" and use enhanced longest completion
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1

" attempt to close vim's completion preview window
" when the completion popup closes
let g:SuperTabClosePreviewOnPopupClose = 1

" First try omni-complete then local completion
autocmd FileType * call SuperTabInit()

fun! SuperTabInit()
  if !exists("b:superTabInitDone") && &omnifunc != ''
    call SuperTabChain(&omnifunc, "<C-x><C-n>")
    call SuperTabSetDefaultCompletionType("context")
    let b:superTabInitDone=1
  endif
endfun
