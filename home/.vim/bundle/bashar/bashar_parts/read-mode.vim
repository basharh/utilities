" TODO: Add a marker to the position that will be scrolled up by
" up and down. Currently, I lose the position that I was reading at
" when I scroll down the page with 'u' and 'd'

" TODO: Automatically toggle read-mode for read-only files.

finish
if exists("loaded_bashar_read_mode")
  finish
endif
let loaded_bashar_read_mode = 1

nnoremap <leader>r :call <SID>ToggleReadMode()<cr>

function! s:ToggleReadMode()

  " Used to prevent toggling 'modifiable' for originally
  " unmodifiable buffers like NERDTree
  if ( !exists("b:originally_modifiable") )
    let b:originally_modifiable = &modifiable
  endif

  if( exists("b:read_mode") && b:read_mode ) " read_mode ON
    set guicursor&
    if ( b:originally_modifiable )
      setlocal modifiable
    endif
    let b:read_mode = 0
    call s:RestorePreReadModeKeys()
  else " read_mode OFF
    set
      \ guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
    " Switch buffers to unmodifiable for read_mode=ON.
    if ( b:originally_modifiable )
      setlocal nomodifiable
    endif
    let b:read_mode = 1
    call s:MapReadModeKeys()
  endif
endfunction

" Since guicursor is global, we need to set it everytime we
" move to a buffer
autocmd BufEnter * call <SID>SetGuiCursor()

function! s:SetGuiCursor()
  if ( exists("b:read_mode") && b:read_mode )
    set
      \ guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
  else
    set guicursor&
  endif
endfunction

function! s:MapReadModeKeys()

  let b:save_j_map = maparg("j", "n")
  let b:save_k_map = maparg("k", "n")
  let b:save_d_map = maparg("d", "n")
  let b:save_u_map = maparg("u", "n")

  nnoremap <buffer> j  
  nnoremap <buffer> k  
  nnoremap <buffer> d  
  nnoremap <buffer> u  
endfunction

function! s:RestorePreReadModeKeys()

  nunmap <buffer> j
  nunmap <buffer> k
  nunmap <buffer> d
  nunmap <buffer> u

  if ( b:save_j_map =~# '\v\S' )
    execute "nmap <buffer> j " . b:save_j_map
  endif

  if ( b:save_k_map =~# '\v\S' ) " If save_k_map is empty string
    execute "nmap <buffer> k " . b:save_k_map
  endif

  if ( b:save_d_map =~# '\v\S' ) " If save_d_map is empty string
    execute "nmap <buffer> d " . b:save_d_map
  endif

  if ( b:save_u_map =~# '\v\S' ) " If save_u_map is empty string
    execute "nmap <buffer> u " . b:save_u_map
  endif
endfunction
