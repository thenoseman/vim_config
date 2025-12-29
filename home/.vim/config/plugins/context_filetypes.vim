if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif

if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif

let g:context_filetype#same_filetypes.c = 'cpp,d'

