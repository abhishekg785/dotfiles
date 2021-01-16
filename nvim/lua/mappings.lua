-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker

local function nmap(command, value, expr)
    vim.fn.nvim_set_keymap('n', command, value, {noremap = true, silent = true, expr = expr})
end

local function imap(command, value, expr)
    vim.fn.nvim_set_keymap('i', command, value, {noremap = true, silent = true, expr = expr})
end

local function vmap(command, value, expr)
    vim.fn.nvim_set_keymap('v', command, value, {noremap = true, silent = true, expr = expr})
end

local function tmap(command, value, expr)
    vim.fn.nvim_set_keymap('t', command, value, {noremap = true, silent = true, expr = expr})
end

-- vim specific maps {{{
-- Swap ' and ` so 'a goes to the line *and* column marked with ma
vim.cmd("nnoremap ' `");
vim.cmd("nnoremap ` '");

-- move by bigger jumps when holding CTRL
nmap('<C-j>', '10j')
nmap('<C-k>', '10k')
vmap('<C-j>', '10j')
vmap('<C-k>', '10k')

-- move between word-wrapped lines with j and k
nmap('j', 'gj')
nmap('k', 'gk')

-- save file
nmap('<c-s>', ':w<CR>')
imap('<c-s>', '<Esc>:w<CR>')

-- edit and source vimrc file
nmap('<leader>ev', ':vsplit $MYVIMRC<cr>')
nmap('<leader>sv', ':source $MYVIMRC<cr>')
nmap('<leader>pi', ':PlugInstall<CR>')

-- no more pesky escape (for insert and visual mode)
imap('jj', '<Esc>')

-- move between window like butter
nmap('<leader>h', ':wincmd h<CR>')
nmap('<leader>j', ':wincmd j<CR>')
nmap('<leader>k', ':wincmd k<CR>')
nmap('<leader>l', ':wincmd l<CR>')

-- quick movements
imap('II', '<Esc>I')
imap('AA', '<Esc>A')
imap('OO', '<Esc>O')

-- line modifications
imap('CC', '<Esc>C')
imap('SS', '<Esc>S')
imap('DD', '<Esc>dd')
imap('UU', '<Esc>u')

-- move text up and down
nmap('<A-j>', ':m .+1<CR>')
nmap('<A-k>', ':m .-2<CR4')
imap('<A-j>', '<Esc>:m .+1<CR>==gi')
imap('<A-k>', '<Esc>:m .-2<CR>==gi')
vmap('<A-j>', ":m '>+1<CR>gv=gv")
vmap('<A-k>', ":m '<-2<CR>gv=gv")

-- arrow keys disabled
nmap('<Up>', '<Nop>')
nmap('<Down>', '<Nop>')
nmap('<Left>', '<Nop>')
nmap('<Right>', '<Nop>')

-- toggle search highlight
nmap('<leader>th', ':set hlsearch!<cr>')

-- use clipboard and primary clipboard
nmap('<leader>y' , '"*y')
nmap('<leader>pp', '"*p')
nmap('<leader>Y', '"+y')
nmap('<leader>P', '"+p')

-- add new line up and down without insert mode
-- nmap('<C-o>','O<Esc>')
nmap('<CR>','o<Esc>')
-- }}}

return {
    nmap=nmap,
    imap=imap,
    vmap=vmap,
    tmap=tmap,
}
