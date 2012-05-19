
if exists("loaded_bashar_grep_operator")
  finish
endif
let loaded_bashar_grep_operator = 1

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  " echom "Motion type: " . a:type

  let saved_unnamed_register = @@
  
  if ( a:type ==# 'v' )
    execute "normal! `<v`>y"
  elseif ( a:type ==# 'char' )
    execute "normal! `[v`]y"
  else
    return
  endif

  " echom @@
  " echom shellescape(@@)

  silent execute "grep! -R " . shellescape(@@) . " ."

  let @@ = saved_unnamed_register

endfunction
