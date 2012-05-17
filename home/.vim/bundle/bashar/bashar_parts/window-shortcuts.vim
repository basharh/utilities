
if exists("loaded_bashar_win_shorts")
  finish
endif
let loaded_bashar_win_shorts = 1

" set splitbelow

nnoremap <leader>w+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 1)<cr>
nnoremap <leader>w- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 0)<cr>
nnoremap <leader>v+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 1)<cr>
nnoremap <leader>v- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 0)<cr>

nnoremap <leader>wm :<c-u>call <SID>MoveToWindow(<c-r>=v:count<cr>)<cr>

nnoremap <leader>wo :<c-u>call <SID>CloseOtherWindows<cr>

nmap <leader>wp :<c-u>execute "normal \<lt>c-w>p"<cr>
nmap <leader>wP :<c-u>execute "normal \<lt>c-w>P"<cr>

function! s:ChangeWinSize(count, hor, inc)

  if ( ! a:count )
    let l:count = 10
  else
    let l:count = a:count
  endif

  if ( a:hor && a:inc ) " Increase Horizontal
    execute "resize +" . string(l:count)
  elseif ( a:hor && !a:inc ) " Decrease Horizontal
    execute "resize -" . string(l:count)
  elseif ( !a:hor && a:inc ) " Increase Vertical
    execute "vertical resize +" . string(l:count)
  elseif ( !a:hor && !a:inc ) " Decrease Vertical
    execute "vertical resize -" . string(l:count)
  endif

endfunction

function! s:MoveToWindow(num)
  execute "normal! " . a:num . "\<c-w>w"
endfunction

nnoremap <leader>wo :<c-u>call <SID>CloseOtherWindows()<cr>

function! s:CloseOtherWindows()
  let mywin = winnr()
  windo let w:win_close = 0
  windo call s:MarkWinToClose(mywin)
  windo call s:CloseWindow()
endfunction

" We need to mark windows for closing and not rely on
" win numbers since win numbers can change while
" windoes are being closed.
function! s:MarkWinToClose(winnr)
  if ( &ft !=# "nerdtree" && a:winnr !=# winnr() )
    let w:win_close = 1
  endif
endfunction

function! s:CloseWindow()
  if ( w:win_close )
    close
  endif
endfunction
