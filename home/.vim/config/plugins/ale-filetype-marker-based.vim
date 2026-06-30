scriptencoding utf-8

"
" Set ALE config based on marker file in the current directory
" 
function! SetALEConfig(marker_files, linters, fixers) abort
  " Get the current working directory where Vim was started
  let l:cwd = getcwd()

  " Check if any of the marker files exist in the current directory
  let l:marker_found = ''
  for l:file in a:marker_files
    if filereadable(l:cwd . '/' . l:file)
      let l:marker_found = l:file
      break
    endif
  endfor

  " If a marker file is found, set the ALE variables
  if !empty(l:marker_found)
    if !empty(a:linters)
      let b:ale_linters = a:linters
    endif
    if !empty(a:fixers)
      let b:ale_fix_on_save = get(g:, "ale_fix_on_save", 1)
      let b:ale_fixers = a:fixers
    endif
  endif
endfunction

" Call function for these marker files
autocmd FileType javascript,typescript,vue call SetALEConfig(['.oxfmtrc.json'], {}, { 'javascript': ['oxfmt']})
autocmd FileType javascript,typescript,vue call SetALEConfig(['.oxlintrc.json'], { 'javascript': ['oxlint']} , { 'javascript': ['oxlint', 'oxfmt']})
