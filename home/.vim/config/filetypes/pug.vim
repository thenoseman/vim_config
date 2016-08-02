augroup vim_config
  autocmd FileType pug call s:configurePug()
augroup END

fun! s:configurePug()
  " Angular parens
  syn region pugInterpolation matchgroup=pugInterpolationDelimiter start="{{" end="}}"
endfun
