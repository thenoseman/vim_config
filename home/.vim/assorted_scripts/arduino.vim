fun! s:ArduinoUpload()
  let l:path_to_src = expand('%:p:h')
  let l:env = substitute(filter(readfile('platformio.ini'), 'v:val =~ "env:"')[0], '\(env:\|\[\|\]\)', '', 'g') 
  let l:cmd = 'PLATFORMIO_BUILD_FLAGS=-DDEBUG PLATFORMIO_SRC_DIR=' . l:path_to_src . ' pio run --target=upload --environment=' . l:env
  silent !clear
  execute '!' . l:cmd
endfun

fun! s:CppStubGen()
  let l:path_to_src = expand('%:p:h')
  let l:cmd = '/usr/local/bin/stubgen -N -g -t ' . l:path_to_src . ' -n -l ' . expand('%:p')
  silent !clear
  execute '!' . l:cmd
endfun

com! ArdUpload call s:ArduinoUpload()
com! CppStubgen call s:CppStubGen()
