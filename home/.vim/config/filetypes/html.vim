augroup vim_config
  autocmd BufRead,BufNewFile *.html call s:configureHtml()
augroup END

fun! s:configureHtml()
  " Angular parens interpolation
  syn region ngTplInterpolation start="{{" end="}}" containedin=htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlTitle
  
  hi def link ngTplInterpolation Constant
endfun
