" build_flags = -DDEBUG2
fun! s:ArduinoUpload()
  let l:path_to_src = expand('%:p:h')

  let l:has_build_flags = len(filter(readfile('platformio.ini'), 'v:val =~# "build_flags = "'))
  let l:build_flags = "-DDEBUG"
  echoerr l:has_build_flags
  if l:has_build_flags > 0
    let l:build_flags = substitute(filter(readfile('platformio.ini'), 'v:val =~# "build_flags = "')[0], 'build_flags = ', '', 'g') 
  endif
  let l:env = substitute(filter(readfile('platformio.ini'), 'v:val =~# "env:"')[0], '\(env:\|\[\|\]\)', '', 'g') 

  let l:cmd = 'PLATFORMIO_UPLOAD_FLAGS=-V PLATFORMIO_BUILD_FLAGS=' . l:build_flags . ' PLATFORMIO_SRC_DIR=' . l:path_to_src . ' pio run --target=upload --environment=' . l:env
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
