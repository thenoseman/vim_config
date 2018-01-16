" executes a marked area or the complete buffer as VimScript

command! -bar -range=% VimX execute <line1> . ',' . <line2> . 'y|@"'
