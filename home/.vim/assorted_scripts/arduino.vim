" build_flags = -DDEBUG2
fun! s:ArduinoUpload()
  let l:path_to_src = expand('%:p:h')

  let l:has_build_flags = len(filter(readfile('platformio.ini'), 'v:val =~# "build_flags = "'))
  let l:build_flags = "-DDEBUG"
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

" ARDUINO development

" remove entries from List which match filter
fun! ArduinoFilterPathList(loclist, filter)
  return filter(a:loclist, 'expand("#" . v:val.bufnr . ":p") !~ "' . a:filter . '"')
endfun

fun! ArduinoFilterErrorList(loclist, filter)
  return filter(a:loclist, 'v:val.text !~ "' . a:filter . '"')
endfun

" Filter arduino gcc error messages and remove library error messages
fun! ArduinoFilterErrors()

  if fnamemodify(bufname('%'), ':e') ==? 'cpp'
    let l:list = copy(getloclist(0))

    " Remove errors when path of file contains ...
    let l:removeWhenPathContains = [ '\.piolibdeps' , '\.platformio' ]

    " Remove errors when text contains ...
    let l:removeWhenErrorContains = [ 'mach-o section specifier requires a segment' ]

    " Filter by path
    for l:removeFilter in l:removeWhenPathContains
      let l:list = ArduinoFilterPathList(l:list, l:removeFilter)
    endfor

    " Filter by error string
    for l:removeFilter in l:removeWhenErrorContains
      let l:list = ArduinoFilterErrorList(l:list, l:removeFilter)
    endfor

    " Close if no error found
    if len(l:list) == 0
      sign unplace *
      lclose
    else
      call setloclist(0, l:list)
    endif
  endif

endfun

augroup ALEProgress
  autocmd!
  autocmd User ALELintPost call ArduinoFilterErrors()
augroup end
