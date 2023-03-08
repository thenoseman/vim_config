"
" Config for ALE plugin
"

scriptencoding utf-8

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1 | echo 'ALEFixOnSave=' . g:ale_fix_on_save"

let g:ale_completion_tsserver_autoimport = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" SHELLCHECK use extended mode
let g:ale_sh_shellcheck_executable = 'shellcheck'
let g:ale_sh_shellcheck_options = '-x'

let g:ale_linters = {
\   'ruby': ['standardrb'],
\   'rspec': ['standardrb'],
\   'html': [ '' ],
\   'haml': [ 'htmllint' ],
\   'cpp' : [ 'g++' ],
\   'sh' : [ 'shellcheck' ],
\   'javascript' : [ 'eslint' ],
\   'json' : [ 'jsonlint' ],
\   'svelte': [ 'eslint' ],
\   'terraform': [ 'tflint' ],
\   'vue': [ 'eslint' ],
\   'rust': [ 'analyzer' ],
\   'lua' : [ 'selene' ],
\   'yaml' : [ 'yamllint' ] 
\}

let g:ale_fixers = {
\   'javascript': [ 'prettier', 'eslint' ],
\   'json': [ 'prettier' ],
\   'ruby': [ 'standardrb' ],
\   'rspec': [ 'standardrb' ],
\   'terraform': [ 'terraform' ],
\   'html': [ 'prettier' ],
\   'haml': [ 'trim_whitespace' ],
\   'svelte': [ 'prettier', 'eslint' ],
\   'vue': [ 'prettier', 'eslint'  ],
\   'rust': [ 'trim_whitespace', 'remove_trailing_lines', "rustfmt" ],
\   'lua' : [ 'trim_whitespace', 'remove_trailing_lines', 'stylua' ],
\   'yaml' : [ 'prettier' ] 
\}

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_linter_aliases = {
\   'rspec': 'ruby',
\   'svelte': ['css', 'javascript', 'html'],
\   'vue': ['css', 'javascript', 'html'],
\}

" TIDY
let g:ale_html_tidy_executable= g:homebrew_prefix .. '/bin/tidy'

" Prettier (https://github.com/prettier/prettier/blob/master/docs/options.md)
let g:ale_javascript_prettier_options = '--print-width 120 --trailing-comma es5 --plugin-search-dir=.'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_use_global = 1

" VUE
let g:ale_vue_vls_use_global = 1

" JS/TS
let g:ale_typescript_tsserver_executable = g:homebrew_prefix .. '/bin/tsserver'

" Lua
let g:ale_lua_stylua_options = '--indent-type Spaces --indent-width 2'

" YAML
let g:ale_yaml_yamllint_options = '-c ~/yamllint.yml'
