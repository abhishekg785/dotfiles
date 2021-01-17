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

-- install plugins
nmap('<leader>pi', ':PlugInstall<CR>')
nmap('<leader>pc', ':PlugClean<CR>')

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

-- git specific maps{{{
nmap('<leader>gs', ':G<CR>')
nmap('<leader>gv', ':Gdiff<CR>')
nmap('<leader>gf', ':Flog<CR>')
nmap('<leader>gb', ':Gblame<CR>')
nmap('<leader>gcm',':Gcommit<CR>')
nmap('<leader>gr', ':diffget //3<CR>')
nmap('<leader>gl', ':diffget //2<CR>')

-- git gutter
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0
nmap(")", "<Plug>(GitGutterNextHunk)")
nmap("(", "<Plug>(GitGutterPrevHunk)")
-- }}}

-- plugin specific set{{{

-- vim better whitespace
vim.g.better_whitespace_enabled=1
vim.g.strip_whitespace_on_save=1

-- quick scope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

vim.cmd[[augroup qs_colors]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]]
  vim.cmd[[autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]]
vim.cmd[[augroup END]]

-- enable auto format when write
vim.g.goimports = 1

-- ultisnips snippets support
vim.g.completion_enable_snippet = "UltiSnips"

-- }}}

-- plugin specific maps {{{
-- undotree
nmap('<leader>u', ':UndotreeToggle<CR>')
-- }}}

-- gutentags {{{
vim.g.gutentags_ctags_executable = "/usr/local/bin/ctags"
vim.g.tagbar_ctags_bin = "/usr/local/bin/ctags"

-- generate datebases in my cache directory, prevent gtags files polluting my project
vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')

-- change focus to quickfix window after search (optional).
vim.g.gutentags_plus_switch = 1

vim.g.gutentags_ctags_exclude = {'*.css', '*.html', 'node_modules'}
vim.g.gutentags_ctags_extra_args = {'--fields=+ainKz'}
-- }}}

return {
    nmap=nmap,
    imap=imap,
    vmap=vmap,
    tmap=tmap,
}
