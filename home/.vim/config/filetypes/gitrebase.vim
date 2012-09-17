" gitrebase
augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap <buffer> <silent> P :Pick<CR>
  nnoremap <buffer> <silent> S :Squash<CR>
  nnoremap <buffer> <silent> C :Cycle<CR>
endfun
