
"nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"function! AutoHighlightToggle()
  "let @/ = ''
  "if exists('#auto_highlight') " this is for the toggle off
    "au! auto_highlight
    "augroup! auto_highlight
    "setl updatetime=4000
    "echo 'Highlight current word: off'
    "return 0
  "else " toggle on
    "augroup auto_highlight
      "au!
      "au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    "augroup end
    "setl updatetime=500
    "echo 'Highlight current word: ON'
    "return 1
  "endif
"endfunction

" Everytime I hit <C-i>, I want the search register to change to the word under
" the cursor and turn hls on.

nnoremap <C-i> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

function! AutoHighlightToggle()
    let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
endfunction
