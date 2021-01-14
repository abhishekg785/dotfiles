" settings
source ~/.config/nvim/settings.vim

" plugins
lua require('plugins')

" vim specific maps
source ~/.config/nvim/mappings.vim

lua require('netrw')
lua require('lsp_config')
lua require('treesitter')
