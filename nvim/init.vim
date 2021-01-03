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

" plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'mbbill/undotree'

Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lambdalisue/fern.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'kana/vim-arpeggio'
Plug 'editorconfig/editorconfig-vim'
Plug 'unblevable/quick-scope'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'danishprakash/vim-githubinator'
Plug 'APZelos/blamer.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'vim-airline/vim-airline'

Plug 'mattn/vim-goimports'

call plug#end()
" }}}

" vim specific maps {{{
" Swap ' and ` so 'a goes to the line *and* column marked with ma
nnoremap ' `
nnoremap ` '
" Move by bigger jumps when holding CTRL
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k
" move between word-wrapped lines with j and k
nnoremap j gj
nnoremap k gk

" Quickly clear highlighted matches
map <silent> <Leader><Leader> :nohl<CR>
" Automatically repeat the last visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" save file
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" save left pinky - map minus sign to colon!
nore - :

" edit and source vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" install plugin command
nnoremap <Leader>pi :PlugInstall<CR>

" no more pesky escape (for insert and visual mode)
imap kj <Esc>
imap kJ <Esc>
imap Kj <Esc>
imap KJ <Esc>

" move between like butter
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" quick movements
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O

" line modifications
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u

" move text up and down
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" arrow keys disabled
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" toggle search highlight
nnoremap <leader>th :set hlsearch!<cr>

" use clipboard and primary clipboard
noremap <Leader>y "*y
noremap <Leader>pp "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" add new line up and down without insert mode
" nmap <C-o> O<Esc>
nmap <CR> o<Esc>
" }}}

" plugin specific set{{{

" vim better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" enable auto format when write (default)
let g:goimports = 1

" }}}

" plugin specific map {{{

" arpeggio mappings
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" fern.vim
nnoremap <C-f> :Fern . -reveal=% -drawer -toggle -width=35<CR>

" }}}

" gutentags {{{
let g:gutentags_ctags_executable = "/usr/local/bin/ctags"
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_ctags_exclude = ['*.css', '*.html', 'node_modules']
let g:gutentags_ctags_extra_args = ['--fields=+ainKz']
" }}}

" telescope finder {{{
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
" }}}

" git{{{
" nmap <leader>gr :diffget //3<CR>
" nmap <leader>gl :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gv :Gdiff<CR>
nmap <leader>gf :Flog<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gcm :Gcommit<CR>

" git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" git blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0

" }}}

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
