
if exists("loaded_bashar_save_shortcut")
  finish
endif
let loaded_bashar_save_shortcut = 1

inoremap <M-s> <c-c>:call <SID>ClearWsSave()<cr>
nnoremap <M-s> :call <SID>ClearWsSave()<cr>

function! s:ClearWsSave()
    normal m`
    execute "%substitute/\\s\\+$//ge"
    normal ``
    execute "write"
endfunction
