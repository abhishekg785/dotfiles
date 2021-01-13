" settings
source ~/.config/nvim/settings.vim

" plugins
lua require('plugins')

" vim specific maps
source ~/.config/nvim/mappings.vim

" netrw
source ~/.config/nvim/netrw.vim

" treesitter
source ~/.config/nvim/treesitter.vim

" lsp
lua require('lsp_config')
