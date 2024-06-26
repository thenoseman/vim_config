"
" Keyboard-command related settings.
"

" fix arrow keys in console mode
if has('gui_running')
  set nomacmeta
endif

" leader = Comma
let mapleader = ","

" Keep Block visually marked when indenting
nnoremap > ><CR>gv
nnoremap < <<CR>gv
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Move lines up/down even in visual mode
" @key <C-Up>: Move in visual mode marked lines up (in all modes)
" @key <C-Down>: Move in visual mode marked lines down (in all modes)
nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>

" Show Invisibles (http://vimcasts.org/episodes/show-invisibles/) 
" @key <leader>l: Show EOL and Tab markers (invisible characters)
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" @key <leader>x: closes buffer
nnoremap <leader>x :bd<CR>

" @key <leader><leader>: Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Remap Q to delete last word in normal mode
" @key Q: delete last word in normal mode
nnoremap Q dbxx

" @key <c-s>: Show Highlight group under cursor
map <c-s> :echo "hi<".synIDattr(synID(line("."),col("."),1),"name").'> trans<'.synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<CR>

" ctrl-space: autocomplete via Omnicomplete
imap <c-space> <c-x><c-o>

" Map 'g=' to indent whole buffer
nmap g= :call PreservePosition("normal gg=G")<CR>

" ctrl-n and p for quickfix navigation without loosing focus
autocmd FileType qf nnoremap <buffer> <C-n> :cn<CR><c-w>p   
autocmd FileType qf nnoremap <buffer> <C-p> :cp<CR><c-w>p   
