augroup vim_config
  autocmd FileType arduino call UpdateOrCreateArduinoTagsFile()
augroup END

fun! UpdateOrCreateArduinoTagsFile()
  let mtime_tags = getftime("tags")
  let mtime_file = getftime("platformio.ini")

  if mtime_file > 0 && (mtime_tags == -1 || mtime_file > mtime_tags)
    silent! execute ":!" .g:ctags_bin . " -R ."
  endif

  " ALE config
  "
  " dependencies installed by platformio lib install
  let l:includes = []
  
  let l:piolibs = split(globpath(getcwd() . '/.piolibdeps', '*'), '\n')

  for relpath in l:piolibs
    call add(l:includes, shellescape(relpath))
  endfor

  " ARDUINO includes for platformio
  call add(l:includes, expand($HOME) . '/.platformio/packages/framework-arduinoavr/cores/arduino')
  call add(l:includes, expand($HOME) . '/.platformio/packages/toolchain-atmelavr/avr/include')
  call add(l:includes, expand($HOME) . '/.platformio/packages/framework-arduinoavr/variants/atmega328pb')

  let b:ale_cpp_gcc_options = '-std=c++14 -Wall -ferror-limit=999 -Wno-#warnings -isystem ' . join(l:includes, ' -isystem ')
endfun
