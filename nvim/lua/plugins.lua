local function plug(t)
    vim.cmd[[call plug#begin('~/.config/nvim/plugged')]]
    for _,v in ipairs(t) do
        vim.cmd(string.format([[Plug '%s']], v))
    end
    vim.cmd([[call plug#end()]])
end

plug {
    'mbbill/undotree',
    'ludovicchabant/vim-gutentags',
    'preservim/tagbar',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'machakann/vim-highlightedyank',
    'editorconfig/editorconfig-vim',
    'unblevable/quick-scope',
    'ntpeters/vim-better-whitespace',
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'jiangmiao/auto-pairs',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'rbong/vim-flog',
    'airblade/vim-gitgutter',
    'danishprakash/vim-githubinator',
    'neovim/nvim-lspconfig',
    'nvim-lua/completion-nvim',
    'sirver/ultisnips',
    'honza/vim-snippets',
    'vim-airline/vim-airline',
    'mattn/vim-goimports',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground'
}
