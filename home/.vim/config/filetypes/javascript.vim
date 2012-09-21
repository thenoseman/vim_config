augroup vim_config
  " Automatically add use strict
  autocmd BufRead,BufNewFile *.js call AddTextToTopIfMissing("'use strict';")
augroup END
