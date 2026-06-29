scriptencoding utf-8

" Custom format JSON via biome
" biome is now implemented in ALE so this is just a demonstration
" How to implement a custom formatters
function! FormatJsonViaBiome(buffer) abort
  let l:ft = getbufvar(str2nr(a:buffer), '&filetype')
  "let l:ft = l:ft =~# 'jsonc' ? 'jsonc' : 'json'
  let l:ft = 'json'

  return {
  \   'command': 'biome format --stdin-file-path=file.' . l:ft
  \}
endfunction
execute ale#fix#registry#Add('biomefmt', 'FormatJsonViaBiome', ['json', 'jsonc'], 'format JSON(C) via biome')

"
" ALE FORMATTER
" oxfmt (https://oxc.rs/docs/guide/usage/formatter.html)
"
call ale#Set('oxfmt_use_global', 0)
function! AleFormatOxfmt(buffer) abort
  let l:executable = ale#path#FindExecutable(a:buffer, 'oxfmt', [
    \   'node_modules/oxfmt/bin/oxfmt',
    \   'node_modules/.bin/oxfmt',
    \   '/opt/homebrew/bin/oxfmt',
  \])

  return {
    \   'command': ale#Escape(l:executable) . ' --stdin-filepath %s'
  \}
endfunction

execute ale#fix#registry#Add('oxfmt', 'AleFormatOxfmt', ['js', 'mjs', 'cjs', 'jsx', 'ts', 'mts', 'cts', 'tsx', 'json', 'jsonc', 'json5', 'yaml', 'yml', 'toml', 'html', 'htm', 'vue', 'css', 'scss', 'less', 'md', 'markdown', 'mdx', 'graphql', 'gql', 'hbs', 'handlebars'], 'Format file with oxfmt')
