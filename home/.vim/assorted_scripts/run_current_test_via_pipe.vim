if exists("g:loaded_run_current_test") || &cp || v:version < 700
  finish
endif
let g:loaded_run_current_test = 1

function! RSpecCurrent()
  let s:bin = "bundle exec rspec"
  if(filereadable("bin/rspec"))
    let s:bin = "bin/rspec"
  endif

  if(!filereadable("tmp/test-pipe"))
    echom "IN SHELL DO: mkfifo tmp/test-pipe && while true; do sh -c '$(cat tmp/test-pipe)'; done"
    return
  endif

  if(stridx(expand("%p"), "_spec") > -1 || stridx(expand("%p"), "_scene") > -1)
    let g:rspec_current_rspec_test = expand("%p").":".line(".")
  endif

  echom "running " . g:rspec_current_rspec_test . " via tmp/test-pipe (" . s:bin . ")"
  execute "silent !echo \"" . s:bin . " --color " . g:rspec_current_rspec_test . "\" -f documentation > tmp/test-pipe"
endfunction

autocmd FileType rspec map <leader>r :call RSpecCurrent() <CR>
