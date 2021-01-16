vim.g.mapleader = ' '

local function set(key, value)
    if value == true or value == nil then
        vim.cmd(string.format('set %s', key))
    elseif value == false then
        vim.cmd(string.format('set no%s', key))
    else
        vim.cmd(string.format('set %s=%s', key, value))
    end
end

set 'modeline'
set ('modelines', 5)

set ('compatible', false)

vim.cmd("filetype plugin on")
vim.cmd('syntax on')
vim.cmd('set guicursor=')

set 'number'
set ('encoding', 'utf8')
set ('ffs', 'unix,dos')

set ('laststatus', 2)
set 'ruler'
set 'incsearch'

set ('hlsearch', false)
set ('errorbells', false)
set ('wrap', false)
set ('showmode', false)
set ('joinspaces', false)
set ('backup', false)
set ('swapfile', false)

set 'hidden'
set ('backspace', 'indent,eol,start')
set 'relativenumber'
set 'termguicolors'

------------------------- Indenting -------------------------
-- Copy indent from current line when starting a new line
set 'autoindent'
-- Automatic C program indenting
set 'smartindent'

------------------------- Tabs and spaces -------------------
-- Number of spaces that a <Tab> character is visually represented with
set ('tabstop', 4)
-- Number of spaces that a <Tab> counts for while performing editing operations
set ('softtabstop', 4)
-- Number of spaces to use for each step of (auto)indent
set ('shiftwidth', 4)
-- Insert spaces instead of literal <Tab> characters
set 'expandtab'

set 'ignorecase'
set 'smartcase'
set ('scrolloff', 8)
set ('clipboard', 'unnamedplus')
set ('updatetime', 1000)
set 'autoread'
set ('undodir', '~/.vim/undodir')
set 'undofile'
set ('colorcolumn', 80)
set ('completeopt', 'menuone,noinsert,noselect')

-- Treat :W as :w and :Q as :q
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")

set ('ttimeoutlen', 100)

-- set ('listchars', 'eol:¬,tab:>~,trail:~,extends:>,precedes:<,nbsp:•')
-- set 'list'

------------------------- Command-line completion options -------------------------
-- Character that starts wildcard expansion
set ('wildchar', '<Tab>')
-- Enhanced mode for command-line completion
set 'wildmenu'
set ('wildmode', 'list:longest,full')
