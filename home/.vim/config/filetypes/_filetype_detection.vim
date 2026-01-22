" Custom Filetypes
function! s:DetectTypescriptFiletype()
  " import of test-utils in the first lines?
  if join(getline(1, 6), "") =~ '@vue/test-util'
    set filetype=typescript.vitest
    execute 'CocCommand snippets.addFiletypes vitest'
  endif
endfunction

augroup custom_filetypes
  au BufRead,BufNewFile *.test.ts call s:DetectTypescriptFiletype()
  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.js.erb set filetype=javascript
augroup END
