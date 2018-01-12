augroup vim_config
  autocmd FileType arduino call UpdateOrCreateArduinoTagsFile()
augroup END

fun! UpdateOrCreateArduinoTagsFile()
  let mtime_tags = getftime("tags")
  let mtime_file = getftime("platformio.ini")

  if mtime_file > 0 && (mtime_tags == -1 || mtime_file > mtime_tags)
    silent! execute ":!" .g:ctags_bin . " -R ."
  endif
endfun
