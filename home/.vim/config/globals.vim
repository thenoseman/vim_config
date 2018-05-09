" ctags binary
if has('gui_macvim')
  let g:ctags_bin = '/usr/local/bin/ctags'
else
  let g:ctags_bin = '/usr/bin/ctags'
endif

if !executable(g:ctags_bin)
  echoe 'Please install ctags via homebrew (brew tap universal-ctags/universal-ctags && brew install --HEAD universal-ctags) on mac or from source (https://github.com/universal-ctags/ctags.git)'
endif

if !executable('ripper-tags')
  echoe 'Please install the "ripper-tags" gem via "gem install ripper-tags"'
endif
