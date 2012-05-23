
if exists("loaded_bashar_buffer_preview")
  finish
endif
let loaded_bashar_buffer_preview = 1

function! s:CreateBufferPreviewWindow()

  topleft 10new

  " Reset modifiable and buftype so that we can add stuff
  setlocal modifiable
  setlocal buftype=""
  setlocal winfixheight
  setlocal nobuflisted
  let g:BufList = []

  " Delete to the black hole register(_)
  silent 1,$delete _

  " loop over all buffer numbers and find which one exist and put
  " them in a list use bufname("%") on them
  let s:MaxBufNum = bufnr("$")

  for i in range(1, s:MaxBufNum)
    let buftype = getbufvar( i, '&buftype')
    if ( buflisted(i) && buftype !=# "nofile" )
      call add(g:BufList, bufname(i))
    endif
  endfor

  for i in range(len(g:BufList))
    let @" = g:BufList[i] . "\n"
    normal P
  endfor

  setlocal nomodifiable
  setlocal buftype=nofile
  setlocal ft=bpreview
endfunction

function! s:IsBufferPreviewWindowOpen()
  let l:buf_prev_win_open = 0
  windo if ( &ft ==# "bpreview" ) | let l:buf_prev_win_open = winnr() | endif
  return l:buf_prev_win_open
endfunction

function! s:ToggleBufListWin()
  let l:buf_prev_win_open = s:IsBufferPreviewWindowOpen()

  if ( l:buf_prev_win_open )
    call MoveToWindow( l:buf_prev_win_open )
    close
  else
    call s:CreateBufferPreviewWindow()
    call MoveToWindow( 1 )
  endif
endfunction

" actions: toggle(0), moveto(1)
function! s:BufferPreviewWindowAction( action )
  let l:buf_prev_win_open = s:IsBufferPreviewWindowOpen()

  if ( l:buf_prev_win_open )
    call MoveToWindow( l:buf_prev_win_open )
    if ( a:action ==# "toggle" )
      close
    elseif ( a:action ==# "moveto" )

    endif
  else
    call s:CreateBufferPreviewWindow()
    call MoveToWindow( 1 )
  endif
endfunction

function! OpenFileForBuffer(split)
  let filep = expand("<cfile>")
  execute "normal \<C-W>p"
  if ( a:split )
    execute "split " . filep
  else
    execute "edit " . filep
  endif
endfunction

"Looks for NerdTree Window and goes there
function! s:JumpToBufferPreviewWindow()
  windo if ( &filetype ==# "bpreview" ) | let g:bpreview_winnr = winnr() | endif
  call MoveToWindow(g:bpreview_winnr)
endfunction

nnoremap <C-P> :<C-U>call <SID>BufferPreviewWindowAction("toggle")<cr>

" Jumps to NERDTree Window
nnoremap <leader>wp :call <SID>BufferPreviewWindowAction("moveto")<cr>


