augroup vim_config
  autocmd FileType javascript call JavascriptConfigure()
augroup END

" http://www.vimregex.com/
fun! JavascriptConfigure()
  command! -nargs=0 JsAsync call ToggleBackward(", () =", ", async () =")
  command! -nargs=0 JsOnly call ToggleBackward("it\(\"\h", "it\.only(")
  nmap <F12> :JsOnly<CR>
  nmap <F11> :JsAsync<CR>
endfunction
