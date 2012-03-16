" Config for vim-autoclose

augroup vim_config
  " No <> autocomplete
  au BufEnter * let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "<")
augroup END

" Workaround for bug in autoclose (https://github.com/Townk/vim-autoclose/issues/25)
let g:AutoCloseExpandEnterOn = ""
