" settings
source ~/.config/nvim/settings.vim

" plugins
lua require('plugins')

" vim specific maps
source ~/.config/nvim/mappings.vim

" netrw
source ~/.config/nvim/netrw.vim

lua require('lsp_config')
lua require('treesitter')
