"
" Config for ALE plugin
"

scriptencoding utf-8

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1 | echo 'ALEFixOnSave=' . g:ale_fix_on_save"

let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_open_list = 1

" SHELLCHECK use extended mode
let g:ale_sh_shellcheck_executable = 'shellcheck'
let g:ale_sh_shellcheck_options = '-x'

let g:ale_linters = {
\   'ruby': ['ruby'],
\   'rspec': ['ruby'],
\   'html': [ '' ],
\   'haml': [ 'htmllint' ],
\   'cpp' : [ 'g++' ],
\   'sh' : [ 'shellcheck' ],
\   'javascript' : [ 'eslint' ],
\   'json' : [ 'jsonlint' ],
\   'svelte': [ 'eslint' ],
\   'terraform': [ 'tflint' ],
\   'vue': [ 'eslint' ],
\}

let g:ale_fixers = {
\   'javascript': [ 'prettier' ],
\   'json': [ 'prettier' ],
\   'ruby': [ 'rufo' ],
\   'rspec': [ 'rufo' ],
\   'terraform': [ 'terraform' ],
\   'html': [ 'prettier' ],
\   'svelte': [ 'prettier', 'eslint', 'importjs' ],
\   'vue': [ 'prettier', 'eslint', 'importjs' ],
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_linter_aliases = {
\   'rspec': 'ruby',
\   'svelte': ['css', 'javascript', 'html'],
\   'vue': ['css', 'javascript', 'html'],
\}

" TIDY
let g:ale_html_tidy_executable= '/usr/local/bin/tidy'

" Prettier (https://github.com/prettier/prettier/blob/master/docs/options.md)
let g:ale_javascript_prettier_options = '--print-width 120 --trailing-comma es5'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_use_global = 1

" VUE
let g:ale_vue_vls_use_global = 1
