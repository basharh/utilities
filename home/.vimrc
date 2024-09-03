" Bashar's VIMRC

set encoding=utf-8

let mapleader=","

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
set history=1000

if has("mac") && has("gui")
  set macmeta "Uses the Alt key as the Meta Key
  set guioptions-=T
  set guicursor+=n-v-c:blinkon0
  set guioptions-=L
  set guioptions-=r
  "set guifont=JetBrainsMonoNFM-Regular:h12
  set guifont=Menlo:h12
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
"Plug 'tpope/vim-sensible'
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
"Plug 'chrisbra/nrrwrgn'
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
Plug 'github/copilot.vim'
Plug 'thosakwe/vim-flutter'
Plug 'airblade/vim-rooter'
Plug 'jremmen/vim-ripgrep'
"Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'basharh/bashar-vim'
call plug#end()

set ignorecase

nnoremap <silent> <leader>pc :call popup_clear()<CR>

imap <C-l> <C-x><C-o>

let g:rooter_patterns = ['.git', 'Makefile', 'pubspec.yaml', 'package.json']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-k>"

imap <tab> <ESC>:echo "hello"<cr>
imap <tab> <Esc>:call UltiSnips#ExpandSnippet()<CR>

autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter
