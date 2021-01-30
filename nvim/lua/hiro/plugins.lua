local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end

    local directory = string.format(
        '%s/site/pack/packer/opt/',
        vim.fn.stdpath('data')
    )

    vim.fn.mkdir(directory, 'p')

    local out = vim.fn.system(string.format(
        'git clone %s %s',
        'https://github.com/wbthomason/packer.nvim',
        directory .. '/packer.nvim'
    ))

    print(out)
    print("Downloading packer.nvim...'")
    print("( You'll need to restart now )")

    return
end

return require('packer').startup {
    function(use)
        use {'wbthomason/packer.nvim', opt = true}

        use 'mbbill/undotree'
        use 'ludovicchabant/vim-gutentags'
        use 'preservim/tagbar'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'machakann/vim-highlightedyank'
        use 'editorconfig/editorconfig-vim'
        use 'unblevable/quick-scope'
        use 'ntpeters/vim-better-whitespace'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'jiangmiao/auto-pairs'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'rbong/vim-flog'
        use 'airblade/vim-gitgutter'
        use 'danishprakash/vim-githubinator'
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
        use 'sirver/ultisnips'
        use 'honza/vim-snippets'
        use 'vim-airline/vim-airline'
        use 'mattn/vim-goimports'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/playground'
    end
}
