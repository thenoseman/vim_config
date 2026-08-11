scriptencoding utf-8

let g:ale_filetype_marker_debug = 0

function! SetALEConfigDebug(text)
  if g:ale_filetype_marker_debug
    echom a:text
  endif
endfunction

"
" Set ALE config based on marker file in the current directory
" 
function! SetALEConfig(marker_files, linters, fixers) abort
  " Get the current working directory where Vim was started
  let l:cwd = getcwd()
  "call SetALEConfigDebug("In " .. l:cwd)
  
  " Check if any of the marker files exist in the current directory
  let l:marker_found = ''
  for l:file in a:marker_files
    if filereadable(l:cwd . '/' . l:file)
      let l:marker_found = l:file
      "call SetALEConfigDebug("Marker found: " .. l:file)
      break
    endif
  endfor

  " If a marker file is found, set the ALE variables
  if !empty(l:marker_found)
    let l:ft = &filetype

    if !empty(a:linters)
      let b:ale_linters[l:ft] = a:linters
      "call SetALEConfigDebug("Linters set: " .. string(b:ale_linters))
    endif
    if !empty(a:fixers)
      let b:ale_fix_on_save = get(g:, "ale_fix_on_save", 1)
      let b:ale_fixers[l:ft] = a:fixers
      "call SetALEConfigDebug("Fixers set: " .. string(b:ale_fixers))
    endif
  endif
endfunction

" Call function for these marker files
autocmd FileType javascript,typescript,vue call SetALEConfig(['.oxfmtrc.json'], [], ['oxfmt'])
autocmd FileType javascript,typescript,vue call SetALEConfig(['.oxlintrc.json'], ['oxlint'] , ['oxlint', 'oxfmt'])
