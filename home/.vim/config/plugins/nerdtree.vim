""""""""""""""""""""""""""""""""""""""""
"" NERDTree-specific settings.
""""""""""""""""""""""""""""""""""""""""

" let NERDTree change my working directory if its root changes.
let NERDTreeChDirMode=2

"  NERDTree (KEY: ,d)
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=35
let NERDTreeAutoDeleteBuffer=1
let NERDTreeSortHiddenFirst=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" @plugin: NERDTree
" @key <leader>d: Open NERDTree at the current buffer
noremap <leader>d :call NERDTreeSmartToggle()<CR>

" toggle NERDTree in a smart way:
" Use NERDTree if no buffer is selected or
" use NERDTreeFind if a buffer is active to reveal that file
fun! NERDTreeSmartToggle()
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
    execute ":NERDTreeClose"
  else
    let s:file = expand("%")
    if s:file != ""
      execute ":NERDTreeFind"
    else
      execute ":NERDTree"
    endif
  endif
endfun
