augroup vim_config
  autocmd BufRead,BufNewFile *.js call s:AddUseStrict()
augroup END

" Automatically add use strict
" But only if not in a sprockets .js file (eg. in Rails)
fun! s:AddUseStrict()
  let s:match = search("\/\/= ","cwn")
  if s:match == 0
    call AddTextToTopIfMissing("'use strict';")
  endif
endfun
