if exists("g:loaded_js_eslint_fix")
  finish
endif
let g:loaded_js_eslint_fix= 1

com! Esfix normal :!eslint --fix %<cr>
