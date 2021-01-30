vim.cmd [[packadd vimball]]

require('hiro.globals')

-- load packer.nvim files
require('hiro.plugins')

require('settings')
require('mappings')

require('hiro.lsp')
require('hiro.treesitter')

require('hiro.telescope')
require('hiro.telescope.mappings')
