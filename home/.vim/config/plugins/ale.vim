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
\   'javascript': [ 'prettier' ]
\}
let g:ale_fix_on_save = 1

" Prettier
" https://github.com/prettier/prettier/blob/master/docs/options.md
let g:ale_javascript_prettier_options = '--print-width 100 --trailing-comma es5'
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linter_aliases = {
\   'rspec': 'ruby'
\}

"
" GO
"
let g:ale_linters = {'go': ['gometalinter' ,'gofmt']}

"
" ARDUINO development
"

" remove entries from List which match filter
fun! ArduinoFilterPathList(loclist, filter)
  return filter(a:loclist, 'expand("#" . v:val.bufnr . ":p") !~ "' . a:filter . '"')
endfun

fun! ArduinoFilterErrorList(loclist, filter)
  return filter(a:loclist, 'v:val.text !~ "' . a:filter . '"')
endfun

" Filter arduino gcc error messages and remove library error messages
fun! ArduinoFilterErrors()
 
  if fnamemodify(bufname("%"), ":e") ==? "cpp"
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
