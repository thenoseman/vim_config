" typeScript

augroup vim_config
  autocmd FileType typescript call s:configureTypescript()
augroup END

fun! s:configureTypescript()
  set ballooneval
  autocmd BufNewFile,BufRead *.ts setlocal ballonexpr=tsuquyomi#balloonexpr()
  autocmd FileType typescript setlocal completeopt+=preview
  nmap <buffer> gd :TsuDefinition<cr>
  set updatetime=2000
  autocmd FileType typescript nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>
  autocmd CursorHold,CursorHoldI <buffer> echo tsuquyomi#hint()<CR>
endfun
