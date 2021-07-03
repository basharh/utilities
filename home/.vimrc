" Bashar's VIMRC

set encoding=utf-8

let mapleader = ","

set lines=999
set nocompatible
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set textwidth=79
set number
set ignorecase
set smartcase
set autoindent
set incsearch
set autoread
set showcmd
set cursorline
"set autochdir

if has("mac") && has("gui")
  set macmeta "Uses the Alt key as the Meta Key
  set guioptions-=T
  set guicursor+=n-v-c:blinkon0
  set guioptions-=L
  set guioptions-=r
  set guifont=Menlo-Regular:h14
  autocmd! GUIEnter * set vb t_vb=
endif
" }}}

source $VIMRUNTIME/ftplugin/man.vim

" Tells VIM to run the filetype-specific plugins and
" filetype-specific indent scripts when the filetype
" of a buffer is set
filetype plugin indent on
syntax on

set laststatus=2
set statusline=%F         " Path to the file
set statusline+=\ %y         " FileType
set statusline+=%m         " Modified Flag
set statusline+=%r         " Read-only flag
set statusline+=%=        " Switch to the right side
set statusline+=[l:\ %l, " Separator
set statusline+=\ c:\ %c]        " Current line
set statusline+=\ %P        " Total lines
set statusline+=\ [%{winnr()}]

nnoremap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>g :scs find g <C-R>=expand("<cfile>")<CR><CR>

" Change all back/front ticks to single quote
noremap <leader>k :s/\‘\\|’/'/g<CR>

" Toggle paste options and print it
nnoremap <C-p> :set paste! \| :set paste?<CR>

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

nnoremap <leader>x :qa<cr>

"Leave the old win navs behind, Luke
map <c-w>h <nop>
map <c-w>j <nop>
map <c-w>k <nop>
map <c-w>l <nop>

nnoremap ZZ :write \| :close<cr>

"Go to top of visual selection
vnoremap gt <esc>`>:exec 'norm '.visualmode().'`<lt>'<cr>

"Go to end of visual selection
vnoremap gb <esc>`<lt>:exec 'norm '.visualmode().'`>'<cr>

"Wrap visual selection with quotes
vnoremap <leader>" <esc>`>a"<esc>`<lt>i"<esc>

noremap! <c-k> <c-c>
xnoremap <c-k> <c-c>
cnoremap <c-k> <c-c>

" Prevent s from interfering with incomplete <leader>s mappings
map s <nop>
map K <nop>

nnoremap <M-n> :tnext<cr>
nnoremap <M-p> :tprevious<cr>

" Select next email address
onoremap ine :<c-u>execute "normal! /\\S*@\rvt@"<cr>

nnoremap <leader>sv :vertical split<cr>
nnoremap <leader>sh :split<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>em :split ~/work/worklog.markdown<cr>
nnoremap <leader>et :split ~/TODO.markdown<cr>

"Wrap word in quotes
nnoremap <leader>" ea"<esc>bi"<esc>el

nnoremap <leader>ws :call ToggleWSMatch()<cr>

"Delete trailing whitespace
nnoremap <leader>wc :%substitute/\s\+$//ge<cr>:nohlsearch<cr>:write<cr>

nnoremap <leader>q :quit<cr>

nnoremap <leader>l :ls<cr>

nnoremap <leader>h :execute "help " . expand("<cword>")<cr>

nnoremap <c-h> :set hls!<cr>
nnoremap <c-l> :set list!<cr>

nnoremap <leader>tt :NERDTreeToggle<cr>

"Find the current file in the NERDTree
nnoremap <leader>tf :NERDTreeFind<cr>

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

nnoremap <space> za

" Navigation shortcuts
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

set noswapfile
"let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

nnoremap <silent> <M-n> :tnext<CR>
nnoremap <silent> <M-p> :tprevious<CR>
set tags=./tags;/

let NERDTreeHijackNetrw=1

set splitright
nnoremap <C-n> :execute "split " . expand('%:h')<cr>
nnoremap <C-m> :execute "vsplit " . expand('%:h')<cr>
nnoremap <C-e> :execute "e " . expand('%:h')<cr>

nnoremap <M-n> :tnext<cr>
nnoremap <C-p> :tprev<cr>

nnoremap <M-e> :e!<cr>

nnoremap <silent> <M-f> :ALEFix<CR>

set tags=./tags;
set nofixeol
colorscheme koehler

let g:bufExplorerShowDirectories=0   " Do not show directories.

" I usually use prettier within eslint, so it's not necessary to list it
" another ALE linter and fixer.
let g:ale_linters = {'javascript': ['eslint'],
      \ 'dart': ['analysis_server'],
      \ 'typescript': ['tsserver', 'eslint'],
      \ 'python': ['pyls', 'pylint'],
      \ 'typescriptreact': ['tsserver', 'eslint']}
let g:ale_fixers = {'javascript': ['eslint'],
      \ 'java': ['google_java_format'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'javascriptreact': ['eslint', 'prettier'],
      \ 'dart': ['dartfmt'],
      \ 'python': ['black'],
      \ 'json': ['prettier']}
let g:ale_sign_column_always=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=-1
" let g:ale_completion_enabled=1

nnoremap <C-]> :ALEGoToDefinition<cr>
hi ALEErrorSign guifg=Red
hi ALEWarningSign guifg=Yellow

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxTagName guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

let g:ale_dart_dartfmt_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dartfmt'
let g:ale_dart_analysis_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dart'
let g:dart_language_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot'

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'basharh/bashar-vim'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-sensible'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()
