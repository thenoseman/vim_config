augroup vim_config
  autocmd FileType go call GoConfigure()
augroup END

fun! GoConfigure()
  set autowrite
  nmap <leader>r <Plug>(go-run)
  nmap <leader>D <Plug>(go-doc)
  nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
endfunction

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
