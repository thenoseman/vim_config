"
" Keyboard-command related settings.
"

" fix arrow keys in console mode
if has('gui_running')
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
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" @key <leader>x: closes buffer
nnoremap <leader>x :bd<CR>

" @key <leader>o: closes all buffers but the current one or unsaved ones
nnoremap <leader>o :BufOnly<CR> 

" @key <leader><leader>: Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Remap Q to delete last word in normal mode
" @key Q: delete last word in normal mode
nnoremap Q dbxx

" @plugin: ctrlp
" @key <leader>t: Searches all open buffers for a tag (aka. method, class name, ...)
nmap <leader>t :CtrlPTag<CR>

" @key p: Pastes text and reindents
nnoremap <leader>p p`[v`]=

" @key /: Always search in very magic mode
nnoremap / /\v

" @key ?: Always search in very magic mode
nnoremap ? ?\v

" @key <cr>: Turn of highlighted search terms and <cr>
nnoremap <cr> :nohlsearch<cr>
