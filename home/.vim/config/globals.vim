if !executable('ripper-tags')
  !gem install ripper-tags
endif

if !executable('terraform-ls')
  !brew install terraform-ls
endif

" Turn of html rendering (:h html.vim)
let html_no_rendering=1
