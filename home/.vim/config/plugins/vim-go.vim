let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_experimental = 1
let g:go_fmt_fail_silently = 1

let g:go_highlight_extra_types = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1

augroup vim_config<CR>
  " Auto install binaries if missing
  autocmd BufWritePre *.go call GoCheckBinaries()

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>D <Plug>(go-doc-browser)
augroup END

fun! GoCheckBinaries()
  if !filereadable("./bin/goimports")
    execute ":GoInstallBinaries"
  endif
endfunction
