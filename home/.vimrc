" Bashar's VIMRC

let mapleader = ","

" Option Settings {{{
set nocompatible " Necesary for lots of cool vim things
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set textwidth=71
set number
set ignorecase
set smartcase
set autoindent
set incsearch
set autoread "Automatically load external changes to file
set showcmd "This shows what you are typing as a command.
"set hlsearch " Highlight search findings

if has("mac") && has("gui")
  set macmeta "Uses the Alt key as the Meta Key
endif
" }}}

call pathogen#infect()
Helptags " Tells Pathogen to generate help tags ( I think :/ )

source $VIMRUNTIME/ftplugin/man.vim

" Tells VIM to run the filetype-specific plugins and
" filetype-specific indent scripts when the filetype
" of a buffer is set
filetype plugin indent on
syntax on

" Status Line Settings {{{
set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"set statusline=%F%m%r%h%w\ [%l,%v][%p%%]

set statusline=%F         " Path to the file
set statusline+=\ %y         " FileType
set statusline+=%m         " Modified Flag
set statusline+=%r         " Read-only flag
set statusline+=%=        " Switch to the right side
set statusline+=[l:\ %l, " Separator
set statusline+=\ c:\ %c]        " Current line
"set statusline+=%L        " Total lines
"set statusline+=\ %p        " Total lines
set statusline+=\ %P        " Total lines
set statusline+=\ [%{winnr()}]
" }}}

" General or Multi-filetype autocommands {{{
augroup bashar_group
  autocmd!
  autocmd vimenter * NERDTree " Launch NERDTree at start
  autocmd FileType html,c,java setlocal shiftwidth=4 tabstop=4
  autocmd FileType python,javascript,html,css,java
    \ setlocal formatoptions-=t "noexpandtab
  " Automatically cd into the directory that the file is in
  "autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
  " Remove any trailing whitespace that is in the file
  " autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
  " autocmd BufRead,BufWrite * match Error /\s\+$/
augroup END
" }}}

" {{{ Markdown settings
augroup markdown_group
  autocmd!
  autocmd FileType markdown
    \ onoremap <buffer> ih
    \ :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Mappings {{{

nnoremap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>g :scs find g <C-R>=expand("<cfile>")<CR><CR>

" Change all back/front ticks to single quote
noremap <leader>k :s/\‘\\|’/'/g<CR>

" Toggle paste options and print it
nnoremap \v :set paste! \| :set paste?<CR>

" nnoremap <silent> <M-k> :wincmd k<CR>:echo winnr()<cr>
" nnoremap <silent> <M-j> :wincmd j<CR>:echo winnr()<cr>
" nnoremap <silent> <M-h> :wincmd h<CR>:echo winnr()<cr>
" nnoremap <silent> <M-l> :wincmd l<CR>:echo winnr()<cr>

nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> <M-j> :wincmd j<CR>
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> <M-l> :wincmd l<CR>

nnoremap <silent> <leader>w= :wincmd =<CR>
nnoremap <silent> <leader>v= :wincmd =<CR>

" Map ^[har to <M-char>
" Adoped from:
" http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
if !has("gui")
  let c="a"
  while c <= "z"
    let imapping = "imap \e" . c . " \<M-" . c . ">"
    let nmapping = "nmap \e" . c . " \<M-" . c . ">"
    execute imapping
    execute nmapping
    let c = nr2char(1+char2nr(c))
  endwhile
endif

" Quick save
inoremap <M-s> <c-c>:write<cr>
nnoremap <M-s> :write<cr>
nnoremap <leader>x :qa<cr>

"Leave the old win navs behind, Luke
map <c-w>h <nop>
map <c-w>j <nop>
map <c-w>k <nop>
map <c-w>l <nop>

nnoremap ZZ :write \| :close<cr>

nnoremap <M-x> :write<CR>:source %<CR>
inoremap <M-x> <c-c>:write<CR>:source %<CR>

"Go to top of visual selection
vnoremap gt <esc>`>:exec 'norm '.visualmode().'`<lt>'<cr>

"Go to end of visual selection
vnoremap gb <esc>`<lt>:exec 'norm '.visualmode().'`>'<cr>

"Wrap visual selection with quotes
vnoremap <leader>" <esc>`>a"<esc>`<lt>i"<esc>

"Train yourself not to use ESC to go to normal mode
" inoremap <esc> <nop>

" Use <c-k> as <esc> or <c-c>
noremap! <c-k> <c-c>
xnoremap <c-k> <c-c>
cnoremap <c-k> <c-c>

" Prevent s from interfering with incomplete <leader>s mappings
nmap s <nop>

" Select next email address
onoremap ine :<c-u>execute "normal! /\\S*@\rvt@"<cr>

nnoremap <leader>sv :vertical split<cr>
nnoremap <leader>sh :split<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>et :split ~/TODO<cr>

"Wrap word in quotes
nnoremap <leader>" ea"<esc>bi"<esc>el

" Insert Mode mappings that start with a non-control character are
" not good
" nnoremap <leader>x :source %<CR>
" inoremap <leader>x <c-c>:write<CR>:source %<CR>

augroup shortcuts_group
autocmd!
autocmd FileType javascript,c
      \ nnoremap <buffer> <leader>; :<c-u>execute "normal! mqA;\e"<cr>
augroup END

nnoremap <leader>ws :call ToggleWSMatch()<cr>

"Delete trailing whitespace
nnoremap <leader>wc :%substitute/\s\+$//ge<cr>:nohlsearch<cr>:write<cr>

nnoremap <leader>q :quit<cr>

nnoremap <leader>l :ls<cr>

nnoremap <leader>h :execute "help " . expand("<cword>")<cr>

nnoremap <c-h> :set hls!<cr>
nnoremap <c-l> :set list!<cr>
nnoremap <c-n> :tabNext<cr>
nnoremap <C-t> :execute "tabedit " . expand("%")<cr>

" {{{2 NERDTree Mappings *** "
nnoremap <leader>tt :NERDTreeToggle<cr>

"Find the current file in the NERDTree
nnoremap <leader>tf :NERDTreeFind<cr>

" Close NERDTree Mapppings}}}2

" }}}

" Functions {{{

let g:w_toggled = 0
function! ToggleWSMatch()
  if ( g:w_toggled == 0  )
    match Error /\s\+$/
    let g:w_toggled = 1
  else
    match none
    let g:w_toggled = 0
  endif
endfunction

" }}}

" Colors {{{
"color zellner
hi Visual term=reverse ctermfg=11 ctermbg=0
hi Search term=reverse ctermfg=11 ctermbg=0
hi PMenu term=reverse ctermfg=11 ctermbg=0
hi PMenuSel term=reverse ctermfg=0 ctermbg=11
hi Folded ctermfg=1 ctermbg=0
" }}}

nnoremap <space> za
set foldmethod=indent
set foldnestmax=2

"let t_SI = "\033]12;red\007"
"let t_EI = "\033]12;blue\007"

" cscope add ~/cscope.out

