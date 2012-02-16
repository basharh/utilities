set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set textwidth=71

autocmd FileType html,c setlocal shiftwidth=2 tabstop=2

set nu

so $VIM/vim73/ftplugin/man.vim

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable

set autoindent

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
" set hlsearch

"Status line gnarliness
set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

filetype plugin indent on
syntax on

set ignorecase
set smartcase

nmap \x :source %<CR>

" cscope add ~/cscope.out

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>g :scs find g <C-R>=expand("<cfile>")<CR><CR>

" Change all back/front ticks to single quote
map \k :s/\‘\\|’/'/g<CR>
map <C-k> :s/\‘\\|’/'/g<CR>

" Toggle paste options and print it
nnoremap \p :set paste! \| :set paste?<CR>
noremap <C-p> :set paste! \| :set paste?<CR>

nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-l> :wincmd l<CR>
