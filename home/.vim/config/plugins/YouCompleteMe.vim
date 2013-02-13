" Only load if YouCompleteMe plugin is activated (Mac)
if index(g:pathogen_disabled, "YouCompleteMe") == 0
  finish
endif

let g:ycm_min_num_of_chars_for_completion = 4

let g:ycm_filetypes_to_completely_ignore = { 'notes' : 1, 'markdown' : 1, 'text' : 1, 'yaml' : 1, 'sass' : 1 }

let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_key_list_select_completion = ['<Down>', '<Enter>']

let g:ycm_key_list_previous_completion = ['<Up>']

let g:ycm_key_detailed_diagnostics = ''

let g:ycm_key_invoke_completion = '<C-Space>'
