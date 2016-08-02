augroup vim_config
  autocmd BufRead,BufNewFile *.pug call s:configurePug()
augroup END

fun! s:configurePug()
  " Angular parens interpolation
  syn region ngTplInterpolation start="{{" end="}}" containedin=pugTagInlineText
  hi def link ngTplInterpolation Constant
endfun
