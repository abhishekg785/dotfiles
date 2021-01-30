vim.cmd [[packadd vimball]]

require('settings')
require('plugins')
require('mappings')

require('hiro.globals')

require('hiro.lsp')
require('hiro.treesitter')

require('hiro.telescope')
require('hiro.telescope.mappings')
