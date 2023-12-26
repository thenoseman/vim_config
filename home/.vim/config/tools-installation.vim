" Only in GUI vim
if has("gui_running")
  if !executable('terraform-ls')
    !brew install terraform-ls
  endif
endif

