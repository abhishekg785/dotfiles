vim.g.netrw_browse_split = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir = 'rm -r'

vim.fn.nvim_set_keymap('n', '<leader>f', ':Sex!<CR>', {noremap = true, silent = true})
