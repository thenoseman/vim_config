" Keys overview:
" --------------
" <c-space> : Autocomplete
" K         : Show docs (on cursor)
" ,k        : Open docs in browser
" F2        : Find references
" :OR       : Organize imports (JS)
" <tab>     : Snippets
" gd        : Goto definition

let g:coc_config_home = "$HOME/.vim/config/plugins"
let g:coc_data_home = "$HOME/.vim-coc"
let g:coc_snippet_next = '<tab>'

" Map <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Deactivate mapping for vim-endwise to make this mapping work 
" (queue vim-endwise after coc)
let g:endwise_no_mappings=1

" Make <cr> auto select first entry in completion list
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<c-r>=EndwiseDiscretionary()\<CR>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>k :CocCommand rust-analyzer.openDocs<CR>

" Find references
nmap <F2> <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Code actions
" Old workaround: 
" nmap <leader>a v<Plug>(coc-codeaction-selected)<Esc>
nmap <leader>a <Plug>(coc-codeaction-cursor)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" coc-snippet via <tab>
inoremap <silent><expr> <TAB>
      \  coc#pum#visible() ? coc#pum#confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Goto definition
nmap <silent> gd <Plug>(coc-definition)

" Deactivate for filetypes
autocmd FileType gitrebase,vim,gitcommit let b:coc_suggest_disable = 1

" For typscript files open locationlist with errors reported by LSP on save
autocmd BufWritePost *.ts call timer_start(1000, { tid -> execute('execute "CocDiagnostics" | execute "botright lwindow" | execute "wincmd p"') })

" Search based on ripgrep, save the buffer to apply all changes to the
" original files. Replaces vim-grepper and quickfix-reflector.
command! -nargs=1 Fi call coc#rpc#notify('search', ["--fixed-strings", "--smart-case", <f-args>]) 
