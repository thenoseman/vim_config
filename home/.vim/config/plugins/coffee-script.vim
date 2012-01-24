"
" Setting for vim-coffee-script
"

augroup vim_config
  " Autocompile Coffee Script
  autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow
augroup END
