" ctags binary
if has("gui_macvim")
  let g:ctags_bin = '/usr/local/bin/ctags'
else
  let g:ctags_bin = '/usr/bin/ctags'
endif

if !executable(g:ctags_bin)
  echoe "Please install ctags via homebrew (brew install ctags) on mac or 'sudo apt install ctags'"
endif
