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
set autochdir

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

" Prevents from interfering with incomplete <leader>s mappings
map s <nop>
map K <nop>

nnoremap <silent> <M-n> :tnext<CR>
nnoremap <silent> <M-p> :tprevious<CR>

let NERDTreeHijackNetrw=1

set tags=./tags;

let loaded_bashar_grep_operator = 1

let $BAT_THEME='Sublime Snazzy'
let $FZF_DEFAULT_OPTS='--exact'


call plug#begin()
Plug 'scrooloose/nerdtree'
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
Plug 'morhetz/gruvbox'
Plug 'basharh/bashar-vim'
call plug#end()

"let g:ale_fixers['ruby'] = ['rubocop']
nnoremap <C-]> :ALEGoToDefinition<cr>

nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
"nnoremap <leader>ad :GGrep<CR>

let g:airline_section_b = '%-0.50{getcwd()}'
let g:airline_section_c = '%t'
