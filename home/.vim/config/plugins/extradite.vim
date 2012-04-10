"
" Extradite Plugin
"
let g:extradite_showhash=1

fun! CallExtradite()
  exec "NERDTreeClose"
  exec "Extradite"
endfun

" @plugin: Extradite
" @command Gl: Open Extradite buffer
com! Gl call CallExtradite()
