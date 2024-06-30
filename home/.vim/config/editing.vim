""""""""""""""""""""""""""""""""""""""""
"" This file manages all global editing
"" settings, such as indent size, etc.
""""""""""""""""""""""""""""""""""""""""

" automatically indent lines and try to do it intelligently
set autoindent
set smartindent

" backspace behaves 'normally'
set backspace=indent,eol,start

" automatically reload a file if it's changed outside vim
set autoread

" format settings
" t - Auto-wrap text using textwidth
" c - Auto-wrap comments using textwidth, inserting the current comment
"     leader automatically.
" r - Automatically insert the current comment leader after hitting <Enter>
"     in Insert mode.
" q - Allow formatting of comments with "gq".
"     Note that formatting will not change blank lines or lines containing
"     only the comment leader. A new paragraph starts after such a line,
"     or when the comment leader changes.
" n - When formatting text, recognize numbered lists.
" 2 - When formatting text, use the indent of the second line of a paragraph
"     for the rest of the paragraph, instead of the indent of the first line.
" 1 - Don't break a line after a one-letter word. It's broken before it
"     instead (if possible).
set formatoptions=crqn21

" Two Spaces, always
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Dont break lines
set textwidth=0
set nolinebreak
set wrap

" Always keep 2 lines on screen while scolling
set scrolloff=2
set sidescrolloff=3

" use system clipboard
set clipboard=unnamed

" Wait less milliseconds before executing command
set timeoutlen=500

" Dont wait the default 4 seconds for CursorHold
set updatetime=300

" Number of screen lines to use for the command-line.
set cmdheight=2

" don't care for octal or hex values when using VIMs arithmetic function
set nrformats=

" More natural split direction
set splitbelow
set splitright

" add minus / dash to motion word separator
" usefull for motiond like inner-word that then
" also use - as a delimeter
set iskeyword+=-

" Provides tab-completion for all file-related tasks
set path=.,**

" overwrite ftplugin/gitcommit.vim
au FileType gitcommit setlocal tw=120

" Taken from http://vim.wikia.com/wiki/Change_font_size_quickly
" Scale font with ctrl+shift+Up or Down Keys
nnoremap <c-s-Up> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)+2)','')<CR>
nnoremap <c-s-Down> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)-2)','')<CR>

" Settings that control tab-completion,
" wildcard menus, etc.
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum

set completeopt=menu,preview,longest " complete options
set dictionary+=/usr/share/dict/words "use mac words file for <c-x><c-k>
