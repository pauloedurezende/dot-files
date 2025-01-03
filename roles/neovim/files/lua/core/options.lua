-- Set <Space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General settings
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.showmode = false -- Don't show mode
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history to file
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
vim.opt.signcolumn = 'yes' -- Always show the sign column
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true -- Horizontal splits will automatically be below
vim.opt.list = true -- Show some invisible characters (tabs, trailing spaces)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Characters to show in list mode
vim.opt.inccommand = 'split' -- Show live preview of substitutions
vim.opt.cursorline = true -- Highlight the current line
vim.opt.scrolloff = 10 -- Minimum number of screen lines to keep above and below the cursor
vim.opt.hlsearch = true -- Highlight search results

-- Enable automatic and smart indentation for better code formatting
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tab and indentation settings
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2 -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
