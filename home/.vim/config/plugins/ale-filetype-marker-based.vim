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
function! SetALEConfig(options) abort
  " Get the current working directory where Vim was started
  let l:cwd = getcwd()
  "call SetALEConfigDebug("In " .. l:cwd)

  " Check if any of the marker files exist in the current directory
  let l:marker_found = ''
  for l:file in get(a:options, 'marker_file', [])
    if filereadable(l:cwd . '/' . l:file)
      let l:marker_found = l:file
      "call SetALEConfigDebug("Marker found: " .. l:file)
      break
    endif
  endfor

  " If a marker file is found, set the ALE variables
  if !empty(l:marker_found)
    let l:ft = &filetype

    if !empty(get(a:options, 'linters', []))
      let b:ale_linters = get(b:, 'ale_linters', {})
      let b:ale_linters[l:ft] = get(a:options, 'linters')
      "call SetALEConfigDebug("Linters set: " .. string(b:ale_linters))
    endif
    if !empty(get(a:options, 'fixers', []))
      let b:ale_fix_on_save = get(g:, "ale_fix_on_save", 1)
      let b:ale_fixers = get(b:, 'ale_fixers', {})
      let b:ale_fixers[l:ft] = get(a:options, 'fixers')
      "call SetALEConfigDebug("Fixers set: " .. string(b:ale_fixers))
    endif
  endif
endfunction

" Call function for these marker files
augroup vim_config_ale_marker
  autocmd!
  autocmd FileType javascript,typescript,vue call SetALEConfig({'marker_file': ['.oxfmtrc.json'], 'fixers': ['oxfmt']})
  autocmd FileType javascript,typescript,vue call SetALEConfig({'marker_file': ['.oxlintrc.json'], 'linters': ['oxlint'], 'fixers': ['oxlint', 'oxfmt']})
augroup END
