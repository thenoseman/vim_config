augroup vim_config
  " Auto install binaries if missing on first save
  autocmd BufWritePre *.go call GoCheckBinaries()

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>D <Plug>(go-doc-browser)
augroup END

fun! GoCheckBinaries()
  if !filereadable("./bin/goimports")
    execute ":GoInstallBinaries"
  endif
endfunction
