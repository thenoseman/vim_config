"
" Config for ALE plugin
"
" https://github.com/dense-analysis/ale/blob/master/doc/ale.txt
scriptencoding utf-8

" Custom format JSON via biome
" biome is now implemented in ALE so this is just a demonstration
" How to implement custom formatters

function! FormatJsonViaBiome(buffer) abort
  let l:ft = getbufvar(str2nr(a:buffer), '&filetype')
  "let l:ft = l:ft =~# 'jsonc' ? 'jsonc' : 'json'
  let l:ft = 'json'

  return {
  \   'command': 'biome format --stdin-file-path=file.' . l:ft
  \}
endfunction
execute ale#fix#registry#Add('biomefmt', 'FormatJsonViaBiome', ['json', 'jsonc'], 'format JSON(C) via biome')

" Toggle formatter on/off
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1 | echo 'ALEFixOnSave=' . g:ale_fix_on_save"

let g:ale_completion_tsserver_autoimport = 1
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
\   'ruby':        [ 'standardrb'],
\   'rspec':       [ 'standardrb'],
\   'html':        [ 'trim_whitespace' ],
\   'haml':        [ 'hamllint' ],
\   'cpp' :        [ 'g++' ],
\   'sh' :         [ 'shellcheck' ],
\   'javascript' : [ 'eslint' ],
\   'typescript' : [ 'eslint' ],
\   'json' :       [ 'jsonlint' ],
\   'svelte':      [ 'eslint' ],
\   'terraform':   [ 'tflint' ],
\   'vue':         [ 'eslint' ],
\   'rust':        [ 'analyzer' ],
\   'lua' :        [ 'selene' ],
\   'yaml' :       [ 'yamllint' ] 
\}

" aliases: NEW => OLD
let g:ale_linter_aliases = {
\   'rspec':  [ 'ruby'],
\   'svelte': [ 'css', 'javascript', 'html'],
\   'vue':    [ 'css', 'javascript', 'html'],
\   'jsonc':  [ 'json' ],
\}

let g:ale_fixers = {
\   'css':        [ 'prettier' ],
\   'javascript': [ 'prettier', 'eslint' ],
\   'typescript': [ 'eslint' ],
\   'json':       [ 'biomefmt' ],
\   'jsonc':      [ 'biomefmt' ],
\   'ruby':       [ 'standardrb' ],
\   'rspec':      [ 'standardrb' ],
\   'terraform':  [ 'terraform' ],
\   'html':       [ 'prettier' ],
\   'haml':       [ 'trim_whitespace' ],
\   'svelte':     [ 'prettier', 'eslint' ],
\   'vue':        [ 'prettier', 'eslint' ],
\   'rust':       [ 'trim_whitespace', 'remove_trailing_lines', "rustfmt" ],
\   'lua' :       [ 'trim_whitespace', 'remove_trailing_lines', 'stylua' ],
\   'yaml' :      [ 'prettier' ],
\   'hcl' :       [ 'packer' ],
\   'sh' :        [ 'shfmt' ] 
\}

" Specify fixers for any path containing '/something/' in its path. 
" Disable fixers by specifying [] 
"
" This allow to set any ale_* variable per path match.
" 
" See https://github.com/dense-analysis/ale/issues/1378
let g:ale_pattern_options = {
\   '/consent-management/': {
\     'ale_fix_on_save': 1,
\     'ale_fixers': extend(copy(g:ale_fixers), {
\       'javascript' : [ 'eslint' ],
\       'typescript' : [ 'eslint' ],
\       'html' : [ 'trim_whitespace' ],
\       'yaml' : []
\     })
\   }
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

" VUE
let g:ale_vue_vls_use_global = 1

" JS/TS
"let g:ale_typescript_tsserver_executable = g:homebrew_prefix .. '/bin/managed-by-coc-and-here-disabled'
let g:ale_javascript_eslint_options = '--cache --cache-file /tmp/eslint-cache'

" Lua
let g:ale_lua_stylua_options = '--indent-type Spaces --indent-width 2'

" YAML
let g:ale_yaml_yamllint_options = '-c ~/yamllint.yml'

" HCL
let g:ale_packer_fmt_executable = g:homebrew_prefix .. '/bin/packer'
