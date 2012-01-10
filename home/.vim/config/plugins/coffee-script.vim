"
" Setting for vim-coffee-script
"

" Autocompile Coffee Script
autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow
