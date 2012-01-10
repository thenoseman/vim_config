"
" Config for vim-autoclose
" Must source fist :(
"source ~/.vim/bundle/vim-autoclose-townk/plugin/AutoClose.vim

" No <> autocomplete
au BufEnter * let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "<")
