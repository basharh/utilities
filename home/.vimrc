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
set completeopt-=preview
"set completeopt+=popup
set completeopt+=menu

if has("mac") && has("gui")
  set macmeta "Uses the Alt key as the Meta Key
  set guioptions-=T
  set guicursor+=n-v-c:blinkon0
  set guioptions-=L
  set guioptions-=r
  set guifont=Menlo-Regular:h13
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

"nnoremap <silent> <M-n> :tnext<CR>
"nnoremap <silent> <M-p> :tprevious<CR>

let loaded_bashar_grep_operator = 1

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
"Plug 'prisma/vim-prisma'
"Plug 'leafgarland/typescript-vim'
Plug 'chrisbra/nrrwrgn'
Plug 'HerringtonDarkholme/yats'
Plug 'prisma/vim-prisma'
Plug 'hashivim/vim-terraform'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
"Plug 'mattn/vim-lsp-settings'
"Plug 'yegappan/lsp'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'voldikss/vim-floaterm'
Plug 'basharh/bashar-vim'
call plug#end()

nnoremap <silent> <leader>pc :call popup_clear()<CR>

# this is for a custom hacked code that I added to vim-lsp so that it can
# automatically jump to first definition when there are multiple options
let g:vim_lsp_jump_to_first = 1
