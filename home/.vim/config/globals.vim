" Only in GUI vim
if has("gui_running")
  if !executable('ripper-tags')
    !gem install ripper-tags
  endif

  if !executable('terraform-ls')
    !brew install terraform-ls
  endif
endif

" Turn off html rendering (:h html.vim)
let html_no_rendering=1
