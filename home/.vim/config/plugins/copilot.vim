" To add workspace folders create "config/private/copilot-workspace-folders.vim with the following content:
"
" let g:copilot_workspace_folders = [
" \  '~/some/path/to/sources'
" \ ]

"
let g:copilot_no_tab_map = v:true

" option + enter / option + tab
imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
imap <silent><script><expr> <M-tab> copilot#Suggest()

" Disabled by default, ony triggered by Leader + o + KEY
let g:copilot_filetypes = {
\ '*': v:false,
\ }

