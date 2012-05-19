
" nnoremap <CR> :<C-U>echo expand("<cfile>")<cr>

" nnoremap <CR> <C-W>p :execute "split " . expand("<cfile>")<cr>

nnoremap <buffer> <CR> :call OpenFileForBuffer(0)<cr>
nnoremap <buffer> o :call OpenFileForBuffer(0)<cr>
nnoremap <buffer> i :call OpenFileForBuffer(1)<cr>
