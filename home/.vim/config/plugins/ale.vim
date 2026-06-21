"
" Config for ALE plugin
"
" https://github.com/dense-analysis/ale/blob/master/doc/ale.txt
scriptencoding utf-8

let g:ale_echo_msg_format = '[%linter%] %code%: %s'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 'on_save'
let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'
let g:ale_sign_highlight_linenrs = 1

" Disable all LSPs since we have COC.cim for that. This also disables
" terraform-lsp
let g:ale_disable_lsp = 1
let g:ale_lsp_suggestions = 0
let g:ale_popup_menu_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'html':             [ 'trim_whitespace', 'biome' ],
\   'cpp' :             [ 'g++' ],
\   'sh' :              [ 'shellcheck' ],
\   'javascript' :      [ 'eslint' ],
\   'javascriptreact' : [ 'eslint' ],
\   'typescript' :      [ 'eslint', 'biome' ],
\   'json' :            [ 'biome' ],
\   'terraform':        [ 'tflint' ],
\   'vue':              [ 'eslint' ],
\   'lua' :             [ 'selene' ],
\   'toml' :            [ 'tombi' ],
\   'yaml' :            [ 'yamllint' ] 
\}

" aliases: NEW => OLD
let g:ale_linter_aliases = {
\   'vue':    [ 'css', 'javascript', 'html'],
\   'jsonc':  [ 'json' ],
\}

let g:ale_fixers = {
\   'css':             [ 'oxfmt' ],
\   'javascript':      [ 'oxfmt', 'eslint' ],
\   'javascriptreact': [ 'oxfmt', 'eslint' ],
\   'typescript':      [ 'eslint', 'oxfmt' ],
\   'json':            [ 'oxfmt' ],
\   'jsonc':           [ 'oxfmt' ],
\   'terraform':       [ 'terraform' ],
\   'html':            [ 'oxfmt', 'oxfmt' ],
\   'vue':             [ 'oxfmt', 'eslint' ],
\   'lua' :            [ 'trim_whitespace', 'remove_trailing_lines', 'stylua' ],
\   'toml' :           [ 'tombi_format', 'tombi_lint' ],
\   'yaml' :           [ 'oxfmt' ],
\   'hcl' :            [ 'packer' ],
\   'sh' :             [ 'shfmt' ] 
\}

" Specify fixers for any path containing '/something/' in its path. 
" Disable fixers by specifying [] 
let use_biome_for_js = extend(copy(g:ale_fixers), {
\  'json' :       [ 'biome' ],
\  'javascript' : [ 'biome' ],
\  'typescript' : [ 'biome' ]
\})

" Use oxfmt for everything
let use_oxfmt = extend(copy(g:ale_fixers), {
\  'css' :        [ 'oxfmt' ],
\  'html' :       [ 'oxfmt' ],
\  'javascript' : [ 'oxfmt' ],
\  'json' :       [ 'oxfmt' ],
\  'jsonc' :      [ 'oxfmt' ],
\  'markdown' :   [ 'oxfmt' ],
\  'typescript' : [ 'oxfmt' ],
\  'vue' :        [ 'oxfmt' ],
\  'yaml' :       [ 'oxfmt' ],
\})

" This allow to set any ale_* variable per path match.
" See https://github.com/dense-analysis/ale/issues/1378
let g:ale_pattern_options = {
\   '/consent-management/': {
\     'ale_fix_on_save': 1,
\     'ale_fixers': extend(copy(g:ale_fixers), {
\       'javascript' : [ 'eslint' ],
\       'typescript' : [ 'eslint' ],
\       'html' : [ 'trim_whitespace', 'oxfmt' ],
\       'yaml' : [],
\       'json' : [ 'biome' ],
\     })
\   },
\   '/live-config-cli/': {
\     'ale_fix_on_save': 1,
\     'ale_fixers': extend(copy(g:ale_fixers), {
\       'javascript' : [ 'eslint' ],
\       'typescript' : [ 'eslint' ],
\       'html' : [ 'trim_whitespace' ],
\       'yaml' : [],
\       'json' : [ 'biome' ],
\     })
\   },
\   '/consent-management/central-app/': {
\     'ale_fix_on_save': 1,
\     'ale_fixers': use_oxfmt
\   },
\ }

" SHELLCHECK use extended mode
let g:ale_sh_shellcheck_executable = 'shellcheck'
let g:ale_sh_shellcheck_options = '-x'

" TIDY
let g:ale_html_tidy_executable= g:homebrew_prefix .. '/bin/tidy'

" Prettier (https://github.com/prettier/prettier/blob/master/docs/options.md)
" IMPORTANT: Tag the root of your repo with an (empty) .prettierignore file
" See https://github.com/dense-analysis/ale/blob/master/autoload/ale/fixers/prettier.vim#L38
"let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--print-width 120 --plugin-search-dir=.'
let g:ale_javascript_prettier_use_local_config = 1

" Activate eslint_d (https://github.com/mantoni/eslint_d.js/)
let $ESLINT_D_PPID = getpid()
let $ESLINT_D_MISS = 'fail'
let g:ale_javascript_eslint_options = '--cache --cache-location /tmp/eslint-cache/'
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1

" Lua
let g:ale_lua_stylua_options = '--indent-type Spaces --indent-width 2'

" YAML
let g:ale_yaml_yamllint_options = '-c ~/yamllint.yml'

" HCL
let g:ale_packer_fmt_executable = g:homebrew_prefix .. '/bin/packer'
