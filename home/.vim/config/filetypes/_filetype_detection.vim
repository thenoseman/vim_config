" Custom Filetypes
function! s:DetectTypescriptFiletype()
  " import of test-utils in the first 20 lines?
  if join(getline(1, 10), "") =~ '@vue/test-util'
    set filetype=typescript.vitest
    let b:coc_snippets_filetypes = ['typescript-vitest']
  endif
endfunction

augroup custom_filetypes
  au BufRead,BufNewFile *.test.ts call s:DetectTypescriptFiletype()
  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.js.erb set filetype=javascript
augroup END
