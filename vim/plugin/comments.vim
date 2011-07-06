
nmap <silent> \c :set opfunc=CommentLines<CR>g@
vmap <silent> \c :<C-U>call CommentLines(visualmode(), 1)<CR>

nmap <silent> \u :set opfunc=UncommentLines<CR>g@
vmap <silent> \u :<C-U>call UncommentLines(visualmode(), 1)<CR>

function! CommentLines(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        let l1_m = "'<"
        let l2_m = "'>"
    else
        let l1_m = "'["
        let l2_m = "']"
    endif

    let line1 = line(l1_m)
    let line2 = line(l2_m)
    exe line1 . ", " . line2 . "normal! I" . '"' . "\<Esc>"
    exec "normal " . l2_m

    let &selection = sel_save
endfunction

function! UncommentLines(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        let l1_m = "'<"
        let l2_m = "'>"
    else
        let l1_m = "'["
        let l2_m = "']"
    endif

    let line1 = line(l1_m)
    let line2 = line(l2_m)

    exe line1 . ", " . line2 . 'g/^\s*"/normal ^x'
    exec "normal " . l2_m

    let &selection = sel_save
endfunction

