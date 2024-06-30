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

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
" Stolen from http://stackoverflow.com/a/5403847/171364 (janus repo)
fun! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

function! s:CloseIfOnlyQuickfixLeft()
  if &buftype=="quickfix"
    if winnr("$") == 1
      q
    endif
  endif
endfunction

" Automatically restore cursor position when possible
augroup vim_config
  autocmd BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") && !exists("g:vim_commandline") |
     \ exe "normal! g`\"" |
     \ endif
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  autocmd BufEnter * call s:CloseIfOnlyQuickfixLeft()
augroup END

