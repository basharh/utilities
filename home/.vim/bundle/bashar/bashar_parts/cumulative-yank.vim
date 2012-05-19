
nnoremap YY :call <SID>Yank()<cr>

function! s:Yank()
  let last_char = strpart(@", strlen(@") - 1, 1 )
  if ( last_char !=# "\n" )
    let @" = @" . "\n"
  endif
  let temp = @"
  normal yy
  let @" = temp . @"
endfunction

