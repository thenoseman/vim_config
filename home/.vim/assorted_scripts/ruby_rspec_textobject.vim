" Stolen from https://github.com/nelstrom/vim-textobj-rubyblock
" and modified to detect rspec locks as block limits
"
if exists('g:loaded_textobj_rubyrspecblock')  "{{{1
  finish
endif

" Interface  "{{{1
call textobj#user#plugin('rubyrspecblock', {
\      '-': {
\        'sfile': expand('<sfile>:p'),
\        'select-a': 'ar',  '*select-a-function*': 's:select_a',
\        'select-i': 'ir',  '*select-i-function*': 's:select_i'
\      }
\    })

" Misc.  "{{{1
let s:comment_escape = '\v^[^#]*'
let s:block_openers = '\zs(<def>|<if>|<do>|<module>|<class>|<describe>|<context>|<it>)'
let s:start_pattern = s:comment_escape . s:block_openers
let s:end_pattern = s:comment_escape . '\zs<end>'
let s:skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'

function! s:select_a()
  let s:flags = 'W'

  call searchpair(s:start_pattern,'',s:end_pattern, s:flags, s:skip_pattern)
  let end_pos = getpos('.')

  " Jump to match
  normal %
  let start_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! s:select_i()
  let s:flags = 'W'
  if expand('<cword>') == 'end'
    let s:flags = 'cW'
  endif

  call searchpair(s:start_pattern,'',s:end_pattern, s:flags, s:skip_pattern)

  " Move up one line, and save position
  normal k^
  let end_pos = getpos('.')

  " Move down again, jump to match, then down one line and save position
  normal j^%j
  let start_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

" Fin.  "{{{1

let g:loaded_textobj_rubyrspecblock = 1

" __END__
" vim: foldmethod=marker