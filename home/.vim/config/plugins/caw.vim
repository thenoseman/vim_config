map ,c <Plug>(caw:wrap:toggle)

" For SCSS
autocmd FileType scss let b:caw_oneline_comment = ""
autocmd FileType scss let b:caw_wrap_oneline_comment = ["/*", "*/"]
autocmd FileType scss let b:caw_wrap_multiline_comment = {'right': '*/', 'bottom': '*', 'left': '/*', 'top': '*'}
