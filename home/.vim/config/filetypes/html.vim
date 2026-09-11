syntax match htmlTagName /[a-zA-Z][a-zA-Z0-9._:-]*/ contained
syntax match htmlTagN    /[a-zA-Z][a-zA-Z0-9._:-]*/ contained

highlight link htmlTagName htmlTag
highlight link htmlTagN    htmlTag
