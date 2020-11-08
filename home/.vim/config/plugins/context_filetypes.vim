if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte = 
\[
\   {
\    'start': '<template\%( [^>]*\)\? \%(lang="\%(\(\h\w*\)\)"\)\%( [^>]*\)\?>',
\    'end': '</template>', 'filetype': '\1',
\   },
\   {
\    'start': '<template\%( [^>]*\)\?>',
\    'end': '</template>', 'filetype': 'html',
\   },
\   {
\    'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\    'end': '</script>', 'filetype': 'typescript',
\   },
\   {
\    'start': '<script\%( [^>]*\)\? \%(lang="\%(\(\h\w*\)\)"\)\%( [^>]*\)\?>',
\    'end': '</script>', 'filetype': '\1',
\   },
\   {
\    'start': '<script\%( [^>]*\)\?>',
\    'end': '</script>', 'filetype': 'javascript',
\   },
\   {
\    'start': '<style\%( [^>]*\)\? \%(lang="\%(\(\h\w*\)\)"\)\%( [^>]*\)\?>',
\    'end': '</style>', 'filetype': '\1',
\   },
\   {
\    'start': '<style\%( [^>]*\)\?>',
\    'end': '</style>', 'filetype': 'css',
\   },
\   {
\    'start': '<\(\h\w*\)>',
\    'end': '</\1>', 'filetype': 'svelte-\1',
\   },
\   {
\    'start': '<\(\h\w*\) \%(lang="\%(\(\h\w*\)\)"\)\%( [^>]*\)\?>',
\    'end': '</\1>', 'filetype': '\2',
\   },
\ ]

if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif

let g:context_filetype#same_filetypes.c = 'cpp,d'

