" This command/mapping is adapted from scrooloose's post:
" http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

function! s:VSetSearch()
  let temp = @@
  norm! gvy

  " replaces literal newlines in the copied text with '\\n' =
  " \n(on command line) so that regex will find newlines
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
