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
noremap <Leader>y "*y
noremap <Leader>pp "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" add new line up and down without insert mode
" nmap <C-o> O<Esc>
nmap <CR> o<Esc>
