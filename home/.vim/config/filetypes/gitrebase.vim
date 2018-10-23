" gitrebase
augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap <buffer> <silent> <C-P> :Pick<CR>
  nnoremap <buffer> <silent> <C-S> :Squash<CR>
  nnoremap <buffer> <silent> <C-C> :Cycle<CR>
endfun
