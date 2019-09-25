if exists("g:loaded_run_current_rspec") || &cp || v:version < 700
  finish
endif
let g:loaded_run_current_rspec = 1

" uses spring gem
function! RSpecCurrent()
  let s:bin = "bundle exec rspec"
  if(filereadable("bin/rspec"))
    let s:bin = "bin/rspec"
  endif

  if(!filereadable("tmp/rspec-test-pipe"))
    echom "IN SHELL DO: mkfifo tmp/rspec-test-pipe && while true; do sh -c '$(cat tmp/rspec-test-pipe)'; done"
    return
  endif

  if(stridx(expand("%p"), "_spec") > -1 || stridx(expand("%p"), "_scene") > -1)
    let g:rspec_current_rspec_test = expand("%p").":".line(".")
  endif

  echom "running " . g:rspec_current_rspec_test . " via tmp/rspec-test-pipe (" . s:bin . ")"
  execute "silent !echo \"" . s:bin . " --color " . g:rspec_current_rspec_test . "\" -f documentation > tmp/rspec-test-pipe"
endfunction

map <leader>r :call RSpecCurrent() <CR>
