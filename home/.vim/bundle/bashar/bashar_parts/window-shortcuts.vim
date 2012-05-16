
set splitbelow

" nnoremap <C-i> :resize +1<cr>
" nnoremap <C-o> :resize -1<cr>

" nnoremap <C-+> :<c-u>call <SID>Resize(<c-r>=v:count<cr>)<cr>
" nnoremap <C--> :<c-u>call <SID>Resize(<c-r>=v:count<cr>)<cr>

nnoremap <leader>w+ :<c-u>call <SID>IncWinSize(<c-r>=v:count<cr>)<cr>
nnoremap <leader>w- :<c-u>call <SID>DecWinSize(<c-r>=v:count<cr>)<cr>

function! s:IncWinSize(count)
  if ( ! a:count ) 
    execute "resize +5"
  else
    execute "resize +" . string(a:count)
  endif
endfunction

function! s:DecWinSize(count)
  if ( ! a:count ) 
    execute "resize -5"
  else
    execute "resize -" . string(a:count)
  endif
endfunction

