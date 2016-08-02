" typeScript

augroup vim_config
  autocmd FileType typescript call s:configureTypescript()
  autocmd FileType typescript nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript setlocal completeopt+=preview
augroup END

fun! s:configureTypescript()
  set updatetime=2000

  nmap <buffer> gd :TsuDefinition<cr>

  autocmd CursorHold,CursorHoldI *.ts echo tsuquyomi#hint()
endfun
