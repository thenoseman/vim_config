" Show ruby method visibility in gutter
"
" Opportunistic version that doesn't care for your previous placed signs 
"
" PU = Public
" PV = Private
" PO = Protected
"
" Toggle with :Vis
"
if exists("g:loaded_ruby_method_visibility")
  finish
endif
let g:loaded_ruby_method_visibility= 1

function! RubyMethodVisibility()
  if !exists('g:ruby_visibility_initialized')
    highlight RubyVisibilityPublic     guifg=#00ff00 guibg=NONE ctermfg=3 ctermbg=NONE
    highlight RubyVisibilityPrivate    guifg=#ff0000 guibg=NONE ctermfg=2 ctermbg=NONE
    highlight RubyVisibilityProtected  guifg=#ffff00 guibg=NONE ctermfg=1 ctermbg=NONE

    sign define RubyVisibilityPublic    text=PU texthl=RubyVisibilityPublic
    sign define RubyVisibilityPrivate   text=PV texthl=RubyVisibilityPrivate
    sign define RubyVisibilityProtected text=PO texthl=RubyVisibilityProtected
    let g:ruby_visibility_initialized = 1
    let g:ruby_visibility_placed = 0
  endif

  let s:next_id=47110815 
  let s:from_id=copy(s:next_id)
  let original_getpos = getpos('.')

  call cursor(1,1)

  let current_line = search('^\s*class ','cnW')
  let last_line = getpos("$")[1]
  let visibility = "Public"

  sign unplace *

  if g:ruby_visibility_placed == 1
    let g:ruby_visibility_placed = 0
    let current_line = 0
  endif

  if current_line > 0
    let current_line += 1
    while current_line <= last_line
      let this_line = getline(current_line)
      if match(this_line, 'private$') > -1
        let visibility = "Private"
      elseif match(this_line, 'public$') > -1
        let visibility = "Public"
      elseif match(this_line, 'protected$') > -1
        let visibility = "Protected"
      else
        if match(this_line, '^\s*$') == -1
          silent execute ":sign place ".s:next_id." line=".current_line." name=RubyVisibility".visibility." file=".expand("%:p")
          let s:next_id += 1
        endif
      endif

      let current_line += 1
    endwhile
    let g:ruby_visibility_placed = 1
  endif

  call setpos('.', original_getpos)
endfunction

com! Vis :call RubyMethodVisibility()
