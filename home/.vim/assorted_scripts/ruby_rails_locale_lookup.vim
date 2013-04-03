" Looks up locales in config/locales
" works with t("a.b.c") or t('a.b.c')
"
if exists("g:loaded_ruby_rails_locale_lookup")
  finish
endif
let g:loaded_ruby_rails_locale_lookup= 1

fun! RailsLocaleLookup()
  let s:oldpos = getpos(".")
  let s:locale_string = ""
  let s:match_end = search("[\"']","e", line("."))
  if s:match_end > 0
    let s:match_end = col(".")-2
    let s:match_start = search("[\"']","eb", line("."))
    if s:match_start > 0 
      let s:match_start = col(".")
      let s:locale_string = getline(".")[s:match_start : s:match_end]
    endif
  endif

  if s:locale_string != ""
    let s:grep_term = substitute(s:locale_string, "\\.", ":\\\\_.*", "g")
    execute ":1vimgrep! /" . s:grep_term . "/j config/locales/*.yml" 
    let s:locale_hits = getqflist()
    if len(s:locale_hits) > 0
      let s:source_file = bufname(s:locale_hits[0].bufnr)
      let s:source_line = s:locale_hits[0].lnum
      silent! execute "e +" . s:source_line . " " . s:source_file
      let s:nirvana = search(s:grep_term, "e", line("$"))
      nohl
    else
      redraw
      echon "Locale entry '" . s:locale_string . "' could not be found in config/locales/*.yml"
    endif
  else
    redraw
    echon "No locale string (format a.b.c) found under cursor!"
  endif
endfunction

command! Loc call RailsLocaleLookup() 
