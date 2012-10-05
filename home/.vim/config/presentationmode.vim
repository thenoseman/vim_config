fun! s:PresentationModeEnter()
  " Taken from http://vim.wikia.com/wiki/Change_font_size_quickly
  " Scale font with ctrl+shift+Up or Down Keys
  nnoremap <c-s-Up> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)+2)','')<CR>
  nnoremap <c-s-Down> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)-2)','')<CR>

  " Use a light color scheme
  colorscheme nuvola

  " Scale it up a little
  let &guifont = substitute(&guifont,':h\zs\d\+','20','')

  " Maximize VIM
  set lines=999 columns=999
endfun
com! Presentationmode call s:PresentationModeEnter()
