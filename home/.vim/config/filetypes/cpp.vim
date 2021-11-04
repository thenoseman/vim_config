" Mainly arduino stuff:
augroup vim_config
  autocmd FileType arduino,cpp set foldmethod=marker | set cinkeys=0{,0},0),:,!^F,o,O,e
  autocmd BufWinLeave cpp mkview
  autocmd BufWinEnter cpp silent loadview
augroup END
