scriptencoding utf-8

call ale#Set('javascript_oxlint_executable', 'oxlint')
call ale#Set('javascript_oxlint_use_global', get(g:, 'ale_use_global_executables', 0))

"
" Linter definition for OXLINT
"
function! s:GetOxlintExecutable(buffer) abort
  return ale#path#FindExecutable(a:buffer, 'javascript_oxlint', [
  \   'node_modules/.bin/oxlint',
  \   'node_modules/oxlint/bin/oxlint',
  \ ])
endfunction

function! s:GetOxlintCommand(buffer) abort
  return ale#Escape(s:GetOxlintExecutable(a:buffer)) . ' --format unix %t'
endfunction

function! s:HandleOxlint(buffer, lines) abort
  let l:pattern = '\v^[a-zA-Z]?:?[^:]+:(\d+):(\d+):\s*(.+)$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, l:pattern)
    let l:text = l:match[3]

    call add(l:output, {
    \   'lnum': l:match[1] + 0,
    \   'col': l:match[2] + 0,
    \   'text': l:text,
    \   'type': l:text =~? '\<warning\>' ? 'W' : 'E',
    \ })
  endfor

  return l:output
endfunction

"
" Fixer definition for OXLINT
"
call ale#linter#Define('javascript', {
\   'name': 'oxlint',
\   'executable': function('s:GetOxlintExecutable'),
\   'command': function('s:GetOxlintCommand'),
\   'callback': function('s:HandleOxlint'),
\})

function! AleFixOxlint(buffer) abort
  let l:executable = s:GetOxlintExecutable(a:buffer)

  return {
  \   'command': ale#Escape(l:executable) . ' --fix %t',
  \   'read_temporary_file': 1,
  \}
endfunction

execute ale#fix#registry#Add('oxlint', 'AleFixOxlint', ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue'], 'Fix files with oxlint --fix')
