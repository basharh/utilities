
 "Quickfix mappings
"nnoremap \qf :cfirst<cr>
"nnoremap \qn :cnext<cr>
"nnoremap \qp :cprevious<cr>
"nnoremap \qo :copen<cr>

 "Quickfix toggle
"nnoremap \qt :call <SID>QuickfixToggle()<cr>

" Quickfix mappings
nnoremap <M-1> :cfirst<cr>
nnoremap <M-f> :cnext<cr>
nnoremap <M-b> :cprevious<cr>
nnoremap <M-o> :copen<cr>

" Quickfix toggle
nnoremap <M-t> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0
function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

