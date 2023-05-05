augroup vim_config
  autocmd FileType javascript call JavascriptConfigure()
augroup END

" http://www.vimregex.com/
" For char groups use double \\ (eg. \\a)
fun! JavascriptConfigure()
  command! -nargs=0 JsAsync call ToggleBackward(", () =", ", async () =")
  command! -nargs=0 JsOnly call ToggleBackward(" it\(", " it\.only(")
  nmap <F12> :JsOnly<CR>
  nmap <F11> :JsAsync<CR>
  " For full keyboard where fn is on top right:
  nmap <C-F12> :JsOnly<CR>
  nmap <C-F11> :JsAsync<CR>
endfunction

