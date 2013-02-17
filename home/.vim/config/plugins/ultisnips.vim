if index(g:pathogen_disabled, "ultisnips") > -1
  finish
endif

let g:UltiSnipsUsePythonVersion = 2

" Split vertically on snippet edit
let g:UltiSnipsEditSplit = "vertical"

" Proivate and public snippet dirs
let g:UltiSnipsSnippetsDir = "~/.vim/config/snippets"
let g:UltiSnipsSnippetDirectories = ["snippets"]

" TAB to expand snippets and jump to next
" stopmarker
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Dont auto-rehash on snippet changes
" restart VIm for that
let g:UltiSnipsDoHash=0
