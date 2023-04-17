" Bashar's VIMRC

set encoding=utf-8

let mapleader=","

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
set nofixeol
set noswapfile
set splitright
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

" Tells VIM to run the filetype-specific plugins and
" filetype-specific indent scripts when the filetype
" of a buffer is set
filetype plugin indent on
syntax on

" Change all back/front ticks to single quote
noremap <leader>k :s/\‘\\|’/'/g<CR>

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

" Prevent s from interfering with incomplete <leader>s mappings
map s <nop>
map K <nop>

nnoremap <silent> <M-n> :tnext<CR>
nnoremap <silent> <M-p> :tprevious<CR>

let NERDTreeHijackNetrw=1

nnoremap <silent> <M-f> :ALEFix<CR>

set tags=./tags;
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
      \ 'dart': ['dart-format'],
      \ 'python': ['black'],
      \ 'json': ['prettier']}
let g:ale_sign_column_always=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=-1
" let g:ale_completion_enabled=1
let g:ale_virtualtext_cursor='disabled'

nnoremap <C-]> :ALEGoToDefinition<cr>

"let g:ale_dart_dartfmt_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dartfmt'
"let g:ale_dart_analysis_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dart'
"let g:dart_language_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot'

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
