
if exists("loaded_bashar_quickfix_shorts")
  finish
endif
let loaded_bashar_quickfix_shorts = 1

" Quickfix mappings
nnoremap <M-1> :cfirst<cr>
nnoremap <M-f> :cnext<cr>
nnoremap <M-b> :cprevious<cr>

" Quickfix toggle
nnoremap <M-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0
function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    wincmd =
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    wincmd =
    let g:quickfix_is_open = 1
  endif
endfunction

