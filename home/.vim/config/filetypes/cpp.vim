" Mainly arduino stuff:

augroup vim_config
  autocmd FileType arduino,cpp call UpdateOrCreateArduinoTagsFile()
  autocmd FileType arduino,cpp set foldmethod=marker | set cinkeys=0{,0},0),:,!^F,o,O,e
  autocmd BufWinLeave cpp mkview
  autocmd BufWinEnter cpp silent loadview
augroup END

fun! UpdateOrCreateArduinoTagsFile()
  let l:mtime_tags = getftime('tags')
  let l:mtime_file = getftime('platformio.ini')

  if l:mtime_file > 0 && (l:mtime_tags == -1 || l:mtime_file > l:mtime_tags)
    silent! execute ':!' .g:ctags_bin . ' -R .'
  endif

  " ALE config
  "
  " dependencies installed by platformio lib install
  let l:includes = []
  
  let l:piolibs = split(globpath(getcwd() . '/.piolibdeps', '*'), '\n')

  for l:relpath in l:piolibs
    call add(l:includes, shellescape(l:relpath))
  endfor

  " ARDUINO includes for platformio
  call add(l:includes, expand($HOME) . '/.platformio/packages/framework-arduinoavr/cores/arduino')
  call add(l:includes, expand($HOME) . '/.platformio/packages/toolchain-atmelavr/avr/include')
  call add(l:includes, expand($HOME) . '/.platformio/packages/framework-arduinoavr/variants/atmega328pb')

  let b:ale_cpp_gcc_options = '-std=c++14 -Wall -ferror-limit=999 -Wno-#warnings -isystem ' . join(l:includes, ' -isystem ')
endfun
