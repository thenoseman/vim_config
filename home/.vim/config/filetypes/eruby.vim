augroup vim_config
  " Automatically add magic encoding comment
  autocmd BufRead,BufNewFile *.erb call AddTextToTopIfMissing("<%# encoding: utf-8 %>")
augroup END
