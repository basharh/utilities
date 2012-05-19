
if exists("loaded_bashar_win_shorts")
  finish
endif
let loaded_bashar_win_shorts = 1

" set splitbelow

" Sets the minimum height of a window
set winheight=10

nnoremap <leader>w+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 1)<cr>
nnoremap <leader>w- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 0)<cr>
nnoremap <leader>v+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 1)<cr>
nnoremap <leader>v- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 0)<cr>

nnoremap <leader>wm :<c-u>call MoveToWindow(<c-r>=v:count<cr>)<cr>

" Jumps to NERDTree Window. 
" TODO: This should go into a nerdtree plugin, or 
" only called when NERDTree has been loaded.
nnoremap <leader>wn :call <SID>JumpToNERDTreeWin()<cr>

nnoremap <leader>wo :<c-u>call <SID>CloseOtherWindows<cr>

nnoremap <leader>wP :<c-u>execute "normal \<lt>c-w>P"<cr>
nnoremap <leader>wt :<c-u>execute "normal \<lt>c-w>T"<cr>

nmap <M-p> :<c-u>bprevious<cr>
nmap <M-n> :<c-u>bnext<cr>

nmap <M-3> :<c-u>e #<cr>

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

function! MoveToWindow(num)
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

"Looks for NerdTree Window and goes there
function! s:JumpToNERDTreeWin()
  windo if ( &filetype ==# "nerdtree" ) | let g:nerdtree_winnr = winnr() | endif
  echo g:nerdtree_winnr
  call MoveToWindow(g:nerdtree_winnr)
endfunction

