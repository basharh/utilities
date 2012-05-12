
function! b:TestNTFunc()
  echo "Hello from NT local func"
endfunction

augroup mynerdtree
  autocmd!
  autocmd BufEnter <buffer> :echom "I got into a NERDTREE"
augroup END
