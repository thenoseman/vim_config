" typeScript

augroup vim_config
  autocmd BufNewFile,BufRead *.ts call s:configureTypescript()
augroup END

fun! s:configureTypescript()
  nmap <buffer> gd :TsuDefinition<cr>
  nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>
  setlocal completeopt+=preview
  set ballooneval
  setlocal balloonexpr=tsuquyomi#balloonexpr()
endfun
