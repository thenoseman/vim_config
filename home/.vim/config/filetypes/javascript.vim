augroup vim_config
  autocmd FileType javascript call JavascriptConfigure()
augroup END

fun! JavascriptConfigure()
  command! -nargs=0 JsAsync call ToggleBackward(", () =", ", async () =")
  command! -nargs=0 JsOnly call ToggleBackward("it(", "it\.only(")
endfunction

nmap <F12> :JsOnly<CR>
