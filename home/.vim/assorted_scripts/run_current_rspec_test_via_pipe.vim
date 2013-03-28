if exists("g:loaded_run_current_rspec") || &cp || v:version < 700
  finish
endif
let g:loaded_run_current_rspec = 1

" uses spring gem
function! RSpecCurrent()
  echom "Starting rspec on named pipe tmp/rspec-test-pipe"
  if(!filereadable("bin/rspec"))
    echom "pleas gem install spring && spring binstubs"
    finish
  endif
  if(!filereadable("tmp/rspec-test-pipe"))
    echom "mkfifo tmp/rspec-test-pipe && while true; do sh -c '$(cat tmp/rspec-test-pipe)'; done"
    finish
  else
    execute "silent !echo \"bin/rspec --color " . expand("%p") . ":" . line(".") . "\" > tmp/rspec-test-pipe"
  endif
endfunction

map <leader>r :call RSpecCurrent() <CR>
