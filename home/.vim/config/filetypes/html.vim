augroup vim_config
  autocmd BufRead,BufNewFile *.html call s:configureHtml()
augroup END

fun! s:configureHtml()
  " Angular parens interpolation
  syn region ngTplInterpolation start="{{" end="}}"
  hi def link ngTplInterpolation Constant
endfun
