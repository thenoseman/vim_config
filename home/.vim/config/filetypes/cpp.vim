" Mainly arduino stuff:
augroup vim_config
  autocmd FileType arduino,cpp setlocal foldmethod=marker | setlocal cinkeys=0{,0},0),:,!^F,o,O,e
  autocmd BufWinLeave *.cpp mkview
  autocmd BufWinEnter *.cpp silent loadview
augroup END
