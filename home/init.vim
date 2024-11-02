let mapleader=","
set guifont=Menlo-Regular:h11

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
"set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set signcolumn=yes
set guicursor+=n-v-c:blinkon0
set splitright " so that focus moves to new window
set completeopt-=preview
"set completeopt+=noselect
set noshowcmd
"set splitbelow

call plug#begin("~/.nvim/plugged")
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
  Plug 'honza/vim-snippets'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'notjedi/nvim-rooter.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'stevearc/oil.nvim'
  Plug 'akinsho/flutter-tools.nvim'
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-neotest/nvim-nio'
  Plug 'sidlatau/neotest-dart'
  Plug 'nvim-neotest/neotest'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'mortepau/codicons.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'folke/twilight.nvim'
  Plug 'NeogitOrg/neogit'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'basharh/bashar-nvim'
call plug#end()

nnoremap <leader>ev :split $MYVIMRC<cr>
inoremap <C-c> <Esc>

set maxmempattern=2000000

set background=dark
colorscheme kanagawa

set foldmethod=indent
set foldopen=
set foldlevelstart=99

nnoremap <M-e> :e<CR>
