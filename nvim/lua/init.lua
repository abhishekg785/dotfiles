RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

require('hiro.lsp')
require('hiro.treesitter')

require('hiro.telescope')
require('hiro.telescope.mappings')
