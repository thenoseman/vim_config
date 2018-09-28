" The rufo-vim plugin can't cope with newlines so use this
augroup vim_config
  autocmd BufWritePost *.rb :silent call PreservePosition('%!rufo -x') | silent :w
augroup END
