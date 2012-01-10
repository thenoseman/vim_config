"
" Extradite Plugin
"

fun! CallExtradite()
  exec "NERDTreeClose"
  exec "Extradite"
endfun

com! Gl call CallExtradite()

