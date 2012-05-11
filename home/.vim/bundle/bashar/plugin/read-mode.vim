" TODO: Add a marker to the position that will be scrolled up by
" up and down. Currently, I lose the position that I was reading at
" when I scroll down the page with 'u' and 'd'

nnoremap <leader>r :call <SID>ToggleReadMode()<cr>

function! s:ToggleReadMode()

  if !exists("b:read_mode")
    let b:read_mode=0
  endif

  if( b:read_mode )
    let b:read_mode = 0
    echo "Read Mode off"
    nunmap <buffer> j
    nunmap <buffer> k
    nunmap <buffer> d
    nunmap <buffer> u
    setlocal guicursor&
  else
    let b:read_mode = 1
    echo "Read Mode on"
    nnoremap <buffer> j  
    nnoremap <buffer> k  
    nnoremap <buffer> d  
    nnoremap <buffer> u  
    setlocal
      \ guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
  endif
endfunction

" Since guicursor is global, we need to set it everytime we
" move to a buffer
autocmd BufEnter * call <SID>SetGuiCursor()

function! s:SetGuiCursor()
  if !exists("b:read_mode")
    return
  endif

  if ( b:read_mode )
    set guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
  else
    set guicursor&
  endif
endfunction
