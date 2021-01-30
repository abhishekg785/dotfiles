vim.cmd [[packadd vimball]]

require('hiro.plugins')
require('settings')
require('mappings')

require('hiro.globals')

require('hiro.lsp')
require('hiro.treesitter')

require('hiro.telescope')
require('hiro.telescope.mappings')
