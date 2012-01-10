"
" Config for vim-autoclose
"

" No <> autocomplete
au BufEnter * let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "<")
