" Config for vim-autoclose

augroup vim_config
  " No <> autocomplete
  au BufEnter * let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "<")
augroup END
