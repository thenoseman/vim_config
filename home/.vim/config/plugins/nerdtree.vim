""""""""""""""""""""""""""""""""""""""""
"" NERDTree-specific settings.
""""""""""""""""""""""""""""""""""""""""

" let NERDTree change my working directory if its root changes.
let NERDTreeChDirMode=2

"  NERDTree (KEY: ,d)
let NERDTreeShowBookmarks=1

" Autoclose NERDTree on file open
let NERDTreeQuitOnOpen=1

" Don't show dotfiles
let NERDTreeShowHidden=0

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
      if stridx(s:file, '/.') > -1 || strpart(s:file, 0,1) == "." 
        " a .dotfile! need to reveal it and show dotfiles
        execute ":NERDTree"
        normal I
        call b:NERDTreeRoot.reveal(b:NERDTreeRoot.path.New(s:file))
      else
        execute ":NERDTreeFind"
      endif
    else
      execute ":NERDTree"
    endif
  endif
endfun
