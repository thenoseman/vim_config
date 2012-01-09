""""""""""""""""""""""""""""""""""""""""
"" Keyboard-command related settings.
"" does not contain plugin-specific
"" settings, just 'global' ones.
""""""""""""""""""""""""""""""""""""""""

" fix arrow keys in console mode
if has('gui_running')
  set nomacmeta
else
   set term=ansi
endif

"
" Leader = Comma
"
let mapleader = ","

" navigate among windows using ,[hjkl]
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

" navigate around in buffers...
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" switch ' and `, because:
" ' jumps to the start of the line where a mark is
" ` jumps to the exact location of a mark
" because jumping to the exact location is more useful,
" I like it to be closer to the home row, so I switch the keys.
noremap ' `
noremap ` '

nnoremap ;; :

"
" Keep Block visually marked when indenting
"
nmap > ><CR>gv
nmap < <<CR>gv
vmap > ><CR>gv
vmap < <<CR>gv


" Move lines up/down even in visual mode
nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>

"
" Show Invisibles (http://vimcasts.org/episodes/show-invisibles/) 
"
" Shortcut to rapidly toggle `set list`
" Use the same symbols as TextMate for tabstops and EOLs
nmap <Leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ,x closes buffer and jumps to previous one
nmap <Leader>x :bd<CR>:Tbbp<CR> 

" ,o closes all buffers but the current one or unsaved ones
nmap <Leader>o :BufOnly<CR> 

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Remap X to delete last word in normal mode
nmap Q dbwx
