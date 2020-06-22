" Split vertically on snippet edit
let g:UltiSnipsEditSplit = "vertical"

" Private and public snippet dirs
let g:UltiSnipsSnippetsDir = "~/.vim/config/snippets"
let g:UltiSnipsSnippetDirectories = ["private_snippets"]

" TAB to expand snippets and jump to next
" stopmarker
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
