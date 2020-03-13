if exists("g:loaded_presentationmode")
  finish
endif
let g:loaded_presentationmode= 1

fun! s:PresentationModeEnter()
  " Use a light color scheme
  colorscheme nuvola

  " Scale it up a little
  let &guifont = substitute(&guifont,':h\zs\d\+','20','')

  " Maximize VIM
  set lines=999 columns=999
endfun
com! Presentationmode call s:PresentationModeEnter()
