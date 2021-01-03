" vim:fdm=marker

" vim set {{{
set nocompatible
filetype plugin on

set number
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
set scrolloff=3
set clipboard+=unnamed
set nojoinspaces
set listchars=eol:¬,tab:\→\ ,trail:~,extends:>,precedes:<,nbsp:•
set updatetime=1000
set autoread
set nobackup
set undodir=~/.vim/undodir
set colorcolumn=80
set completeopt=menuone,noinsert,noselect

" Treat :W as :w since this is a common typo
cnoreabbrev W w

set ttimeoutlen=100

" ------------------------- Command-line completion options -------------------------
" Character that starts wildcard expansion
set wildchar=<Tab>
" Enhanced mode for command-line completion
set wildmenu
set wildmode=list:longest,full
" }}}

" plugins
source ~/.config/nvim/plugins.vim

" vim specific maps
source ~/.config/nvim/mappings.vim

" lsp {{{
"
nnoremap <leader>va :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" }}}
