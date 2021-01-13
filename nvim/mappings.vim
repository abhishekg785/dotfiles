" vim: foldmethod=marker

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
map <silent> <leader><leader> :nohl<CR>
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
nnoremap <leader>pi :PlugInstall<CR>

" no more pesky escape (for insert and visual mode)
imap jj <Esc>

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
noremap <leader>y "*y
noremap <leader>pp "*p
noremap <leader>Y "+y
noremap <leader>P "+p

" add new line up and down without insert mode
" nmap <C-o> O<Esc>
nmap <CR> o<Esc>

"}}}

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
