let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_smart_case = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 0
let g:neocomplcache_max_list = 25
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_wildcard = 0
let g:neocomplcache_enable_auto_select = 1

" Must ENABLE auto opening of popup
" else the local buffer matches are not found
" bug in neocomplcache?
let g:neocomplcache_disable_auto_complete = 0
" start at an impossible length (see above)
let g:neocomplcache_auto_completion_start_length = 999

" Close popup on enter
inoremap <expr><silent> <CR> <SID>neocomplcache_cr_function()
function! s:neocomplcache_cr_function()
  return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
endfunction

" <ctrl-space>: completion.
inoremap <expr><C-SPACE> neocomplcache#start_manual_complete() 

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()pumvisible() ? neocomplcache#close_popup() : "\

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
