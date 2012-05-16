
set splitbelow

" nnoremap <C-i> :resize +1<cr>
" nnoremap <C-o> :resize -1<cr>

" nnoremap <C-+> :<c-u>call <SID>Resize(<c-r>=v:count<cr>)<cr>
" nnoremap <C--> :<c-u>call <SID>Resize(<c-r>=v:count<cr>)<cr>

nnoremap <leader>w+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 1)<cr>
nnoremap <leader>w- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 0)<cr>

nnoremap <leader>v+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 1)<cr>
nnoremap <leader>v- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 0)<cr>

function! s:ChangeWinSize(count, hor, inc)

  if ( ! a:count )
    let l:count = 10
  else
    let l:count = a:count
  endif

  if ( a:hor && a:inc ) "Increase Horizontal
    execute "resize +" . string(l:count)
  elseif ( a:hor && !a:inc ) " Decrease Horizontal
    execute "resize -" . string(l:count)
  elseif ( !a:hor && a:inc ) " Increase Vertical
    execute "vertical resize +" . string(l:count)
  elseif ( !a:hor && !a:inc ) " Decrease Vertical
    execute "vertical resize -" . string(l:count)
  endif

endfunction

