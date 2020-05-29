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

"
" <leader>r will execute the current test
"
fun! JestExecuteCurrent()
  let s:itpos = search('it(', 'bcnWz', line("w0"))
  let s:line = getline(s:itpos)
  let s:ittxt = matchstr(getline(s:itpos), "\".*\"")    
  echom 'Running test: ' . s:ittxt[0:10] . ' in ' . expand("%:t")
  execute "silent !echo NODE_ICU_DATA=node_modules/full-icu node node_modules/.bin/vue-cli-service test:unit --runInBand -t " . shellescape(s:ittxt) . " " . expand("%p") . " > tmp/test-pipe"
endfun

autocmd FileType javascript map <leader>r :call JestExecuteCurrent() <CR>
