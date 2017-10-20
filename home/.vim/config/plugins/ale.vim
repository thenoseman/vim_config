"
" Config for ALE plugin
"

let g:ale_sign_error = '💀'
let g:ale_sign_warning = '🤔'
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1

" SHELLCHECK use extended mode 
let g:ale_sh_shellcheck_executable = 'shellcheck -x'

" HAML use local config for linting
let g:ale_haml_hamllint_options = '-c ~/.haml_lint.yml'

let g:ale_fixers = {
  \   'javascript': [
  \       'eslint'
  \   ]
  \}
