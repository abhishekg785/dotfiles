set modeline
set modelines=5

set nocompatible
filetype plugin on

set number
set guicursor=
set encoding=utf8
set ffs=unix,dos

let &t_ut=''

let mapleader = " "
syntax on
set laststatus=2
set ruler
set incsearch
set nohlsearch
set hidden
set noerrorbells
set backspace=indent,eol,start
set relativenumber
set nowrap
set termguicolors
set noshowmode

" ------------------------- Indenting -------------------------
" Copy indent from current line when starting a new line
set autoindent
" Automatic C program indenting
set smartindent

" ------------------------- Tabs and spaces -------------------------
" Number of spaces that a <Tab> character is visually represented with
set tabstop=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" Insert spaces instead of literal <Tab> characters
set expandtab

set ignorecase
set noswapfile
set smartcase
set scrolloff=8
set clipboard=unnamedplus
set nojoinspaces
set listchars=eol:¬,tab:\→\ ,trail:~,extends:>,precedes:<,nbsp:•
set updatetime=1000
set autoread
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=80
set completeopt=menuone,noinsert,noselect

" Treat :W as :w since this is a common typo
cnoreabbrev W w
cnoreabbrev Q q

set ttimeoutlen=100

" ------------------------- Command-line completion options -------------------------
" Character that starts wildcard expansion
set wildchar=<Tab>
" Enhanced mode for command-line completion
set wildmenu
set wildmode=list:longest,full
