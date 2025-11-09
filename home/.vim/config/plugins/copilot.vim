let g:copilot_no_tab_map = v:true

" option + enter / option + tab
imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
imap <silent><script><expr> <M-tab> copilot#Suggest()

" Disabled by default, ony triggered by Leader + o + KEY
let g:copilot_filetypes = {
\ '*': v:false,
\ }

