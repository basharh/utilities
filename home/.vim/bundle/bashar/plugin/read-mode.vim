
nnoremap <leader>r :call <SID>ToggleReadMode()<cr>

let g:read_mode = 0

highlight hiddenCursor guifg=NONE guibg=NONE

function! s:ToggleReadMode()
  if( g:read_mode )
    let g:read_mode = 0
    echo "Read Mode off"
    nunmap j
    nunmap k
    nunmap d
    nunmap u
    set guicursor&
  else
    let g:read_mode = 1
    echo "Read Mode on"
    nnoremap j  
    nnoremap k  
    nnoremap d  
    nnoremap u  
    set guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
  endif
endfunction

