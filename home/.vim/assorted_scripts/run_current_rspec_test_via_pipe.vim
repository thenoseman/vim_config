if exists("g:loaded_run_current_rspec") || &cp || v:version < 700
  finish
endif
let g:loaded_run_current_rspec = 1

" uses spring gem
function! RSpecCurrent()
  echom "Starting rspec on named pipe tmp/rspec-test-pipe"
  if(!filereadable("bin/rspec"))
    echom "please 'gem install spring && spring binstubs rspec'"
    finish
  endif
  if(!filereadable("tmp/rspec-test-pipe"))
    execute "!mkfifo tmp/rspec-test-pipe && while true; do sh -c '$(cat tmp/rspec-test-pipe)'; done"
  endif
  if(stridx(expand("%p"), "_spec") > -1)
    let g:rspec_current_rspec_test = expand("%p").":".line(".")
  endif
  execute "silent !echo \"bin/rspec --color " . g:rspec_current_rspec_test . "\" > tmp/rspec-test-pipe"
endfunction

map <leader>r :call RSpecCurrent() <CR>
