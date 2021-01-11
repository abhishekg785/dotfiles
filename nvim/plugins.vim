" vim: foldmethod=marker

try
    call plug#begin('~/.config/nvim/plugged')

    Plug 'mbbill/undotree'

    Plug 'ludovicchabant/vim-gutentags'
    Plug 'preservim/tagbar'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'lambdalisue/fern.vim'
    Plug 'machakann/vim-highlightedyank'

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

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    Plug 'vim-airline/vim-airline'

    Plug 'mattn/vim-goimports'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    call plug#end()
catch
    echom 'vim-plug not installed'
endtry

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
nmap <leader>gs :G<CR>
nmap <leader>gv :Gdiff<CR>
nmap <leader>gf :Flog<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gcm :Gcommit<CR>
nmap <leader>gr :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

" git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" }}}
