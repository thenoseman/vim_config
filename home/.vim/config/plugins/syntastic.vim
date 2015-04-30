""""""""""""""""""""""""""""""""""""""""
"" Syntastic-specific config settings
""""""""""""""""""""""""""""""""""""""""
" use signs to indicate lines with errors
" only if signs are available
let g:syntastic_enable_signs = 1
let g:syntastic_warning_symbol='⚠'
let g:syntastic_error_symbol='✗'

let g:syntastic_check_on_open = 0

let g:syntastic_echo_current_error = 1

let g:syntastic_id_checkers = 1

let g:syntastic_enable_balloons = 0

let g:syntastic_always_populate_loc_list = 1

" automatically open the location list when a buffer has errors
let g:syntastic_auto_loc_list=1

" In vimdiff Mode do not auto-show the errors
if &diff
  let g:syntastic_auto_loc_list=2
endif
let g:syntastic_loc_list_height=5

" No Check for ...
let g:syntastic_mode_map = {
      \ 'active_filetypes': [], 
      \ 'mode': 'active', 
      \ 'passive_filetypes': ["html","coffee","haml","sass","scss","xml"] }  

" Don't jump to first error on save
let g:syntastic_auto_jump=0

" Run all checkers and aggregate errors
let g:syntastic_aggregate_errors=1

" Force eslint for javascript
let g:syntastic_javascript_checkers=['eslint', 'jshint']   

" Don't build for go programs, just use gofmt
let g:syntastic_go_checkers = ['gofmt', 'golint']
"let g:syntastic_go_gofmt_exec = './bin/goimports'
let g:syntastic_go_golint_exec = './bin/golint'
"let g:syntastic_go_gofmt_args = '-w'
