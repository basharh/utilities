" Bashar's VIMRC

let mapleader = ","

" Option Settings {{{
set nocompatible " Necesary for lots of cool vim things
set tabstop=2
set shiftwidth=2
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
" }}}

" General or Multi-filetype autocommands {{{
augroup bashar_group
  autocmd!
  autocmd FileType html,c setlocal shiftwidth=2 tabstop=2
  " Automatically cd into the directory that the file is in
  autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
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
noremap \k :s/\‘\\|’/'/g<CR>
noremap <C-k> :s/\‘\\|’/'/g<CR>

" Toggle paste options and print it
nnoremap \p :set paste! \| :set paste?<CR>
noremap <C-p> :set paste! \| :set paste?<CR>

nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> <M-j> :wincmd j<CR>
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> <M-l> :wincmd l<CR>

" Fix Alt-keys in terminal.
if ! has("gui")
  nmap k <M-k>
  nmap j <M-j>
  nmap h <M-h>
  nmap l <M-l>
  nmap s <M-s>
  imap s <M-s>
  nmap x <M-x>
  imap x <M-x>
endif

" Quick save
inoremap <M-s> <c-c>:write<cr>
nnoremap <M-s> :write<cr>

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

" Prevent s from interfering with incomplete <leader>s mappings
nmap s <nop>

" Select next email address
onoremap ine :<c-u>execute "normal! /\\S*@\rvt@"<cr>

nnoremap <leader>sv :vertical split<cr>
nnoremap <leader>sh :split<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>xv :source $MYVIMRC<cr>

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

nnoremap <leader>w :call ToggleWSMatch()<cr>

"Delete trailing whitespace
nnoremap <leader>cw :%substitute/\s\+$//ge<cr>

" }}}

" Functions {{{

let g:w_toggled = 0
function! ToggleWSMatch()
  echom "Value of g:w_toggled: " . g:w_toggled
  if ( g:w_toggled == 0  )
    match Error /\s\+$/
    let g:w_toggled = 1
  else
    match none
    let g:w_toggled = 0
  endif
endfunction

" }}}

" cscope add ~/cscope.out
