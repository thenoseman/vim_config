" gitrebase
augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nmap <buffer> <silent> P :Pick<CR>
  nmap <buffer> <silent> S :Squash<CR>
  nmap <buffer> <silent> C :Cycle<CR>
endfun
