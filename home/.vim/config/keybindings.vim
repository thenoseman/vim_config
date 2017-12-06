"
" Keyboard-command related settings.
"

" fix arrow keys in console mode
if has('gui_running') && has("unix")
  set nomacmeta
else
  set term=ansi
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
if has("unix")
  set listchars=tab:▸\ ,eol:¬
else
  set listchars=tab:>-,eol:¬
endif
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" @key <leader>x: closes buffer
nnoremap <leader>x :bd<CR>

" @key <leader><leader>: Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Remap Q to delete last word in normal mode
" @key Q: delete last word in normal mode
nnoremap Q dbxx

" @key <esc>: Kill search highlighting on esc
nnoremap <silent> <Leader><Leader> :nohl<cr><esc>

" @key <c-s>: Show Highlight group under cursor
map <c-s> :echo "hi<".synIDattr(synID(line("."),col("."),1),"name").'> trans<'.synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<CR>

" ctrl-space: autocomplete via crtl-n
imap <c-space> <c-n>

" Map 'g=' to indent whole buffer 
nmap g= :call PreservePosition("normal gg=G")<CR>

