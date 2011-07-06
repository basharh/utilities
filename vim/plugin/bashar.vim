
if exists("g:loaded_bashar")
    finish
endif
let g:loaded_bashar = 1

nmap <silent> \l :set opfunc=RmLeadingWS<CR>g@
vmap <silent> \l :<C-U>call RmLeadingWS(visualmode(), 1)<CR>

" Single line clear leading whitespace
nmap <silent> \ll :s/\m^\s\+//g

" A function to remove leading white spaces in a selection
function! RmLeadingWS(type, ...)

    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        let line1 = line("'<")
        let line2 = line("'>")
        exe line1 . ", " . line2 . 's/\m^\s\+//g'
        exec "normal '<"
    else
        let line1 = line("'[")
        let line2 = line("']")
        exe line1 . ", " . line2 . 's/\m^\s\+//g'
        exec "normal '["
    endif

    let &selection = sel_save
    let @@ = reg_save
endfunction

function! RemoveWS(text)
    return substitute(a:text, "\m^\s\+", "", "g")
endfunction
