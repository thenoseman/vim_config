"
" Stolen from https://github.com/Julian/vim-textobj-brace/blob/master/plugin/textobj/brace.vim
"
" if/af textobject to select bracket delimited blocks
"
if exists('g:loaded_textobj_brace')
  finish
endif

call textobj#user#plugin('brace', {
      \ '-': {
      \     '*sfile*': expand('<sfile>:p'),
      \     'select-a': 'af',  '*select-a-function*': 's:select_a',
      \     'select-i': 'if',  '*select-i-function*': 's:select_i',
      \ }})

function! s:select(object_type)
  call search('[\|(\|{\|<', 'bce')
  let start_position = getpos('.')

  normal! %
  let end_position = getpos('.')
  let end_position[2] = 1000
  let start_position[2] = 0

  if a:object_type ==? 'i'
    let start_position[1] += 1
    let end_position[1] -= 1
  endif

  return ['v', start_position, end_position]
endfunction

function! s:select_a()
  return s:select('a')
endfunction

function! s:select_i()
  return s:select('i')
endfunction

let g:loaded_textobj_brace = 1
