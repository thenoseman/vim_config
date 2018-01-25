"
" Config for ALE plugin
"

scriptencoding utf-8
let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1

" SHELLCHECK use extended mode 
let g:ale_sh_shellcheck_executable = 'shellcheck -x'

let g:ale_linters = {
      \   'ruby': ['ruby'],
      \   'rspec': ['ruby'],
      \   'html': [ '' ],
      \   'cpp' : [ 'g++' ]
      \}

let g:ale_fixers = {
      \   'javascript': [ 'eslint' ]
      \}

"
" ARDUINO development
"

" remove entries from List which match filter
fun! ArduinoFilterList(loclist, filter)
  return filter(a:loclist, 'expand("#" . v:val.bufnr . ":p") !~ "' . a:filter . '"')
endfun

" Filter arduino gcc error messages and remove library error messages
fun! ArduinoFilterErrors()
  let l:list = copy(getloclist(0))

  " Remove errors when path of file contains ...
  let l:removeWhenPathContains = [ '\.piolibdeps' , '\.platformio' ]

  for l:removeFilter in l:removeWhenPathContains
    let l:list = ArduinoFilterList(l:list, l:removeFilter)
  endfor

  " Close if no error found
  if len(l:list) == 0
    lclose
  else
    call setloclist(0, l:list)
  endif

endfun

augroup ALEProgress
  autocmd!
  autocmd User ALELintPost call ArduinoFilterErrors()
augroup end
