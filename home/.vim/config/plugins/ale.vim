"
" Config for ALE plugin
"

let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1

" SHELLCHECK use extended mode 
let g:ale_sh_shellcheck_executable = 'shellcheck -x'

let g:ale_linter_aliases = { 'arduino': 'cpp' }

let g:ale_linters = {
  \   'ruby': ['ruby'],
  \   'html': [ '' ]
\}

let g:ale_fixers = {
  \   'javascript': [ 'eslint' ]
\}

" For arduino
let g:ale_cpp_gcc_options = '-std=c++14 -Wall -isystem ' . expand($HOME) . '/.platformio/packages/framework-arduinoavr/cores/arduino -isystem ' . expand($HOME) . '/.platformio/packages/toolchain-atmelavr/avr/include -isystem ' . expand($HOME) . '/.platformio/packages/framework-arduinoavr/variants/atmega328pb'
