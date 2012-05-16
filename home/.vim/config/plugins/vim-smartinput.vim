" vim-smartinput

" auto insert #{} when pressing # inside of quotes
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({
\   'at': '"\%#"',
\   'char': '#',
\   'input': '#{}<Left>',
\   'filetype': ['ruby'],
\ })

" auto insert || when typing | before a possible block
call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#define_rule({
\   'at': '\({\|\<do\>\)\s*\%#',
\   'char': '<Bar>',
\   'input': '<Bar><Bar><Left>',
\   'filetype': ['ruby'],
\ })

" workaround for https://github.com/kana/vim-smartinput/issues/34
" only insert charactrers if not directly after a word character
call smartinput#define_rule({'at': '\w\%#', 'char': '"', 'input': '"'})
call smartinput#define_rule({'at': '\w\%#', 'char': "'", 'input': "'"})
call smartinput#define_rule({'at': '\w\%#', 'char': '(', 'input': '('})
call smartinput#define_rule({'at': '\w\%#', 'char': "[", 'input': "["})
call smartinput#define_rule({'at': '\w\%#', 'char': "{", 'input': "{"})

call smartinput#define_rule({'at': '\%#\w', 'char': '"', 'input': '"'})
call smartinput#define_rule({'at': '\%#\w', 'char': "'", 'input': "'"})
call smartinput#define_rule({'at': '\%#\w', 'char': '(', 'input': '('})
call smartinput#define_rule({'at': '\%#\w', 'char': "[", 'input': "["})
call smartinput#define_rule({'at': '\%#\w', 'char': "{", 'input': "{"})
