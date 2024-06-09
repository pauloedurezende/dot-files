vim.g.mapleader = ' ' -- Set <Space> as the leader key
vim.g.maplocalleader = ' ' -- Set <Space> as the local leader key

vim.opt.number = true -- Show line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.showmode = false -- Don't show mode
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.breakindent = true -- Set breakindent
vim.opt.undofile = true -- Save undo history to file
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- Ignore case if search pattern is all lowercase
vim.opt.signcolumn = 'yes' -- Always show sign column
vim.opt.updatetime = 250 -- Set updatetime
vim.opt.timeoutlen = 300 -- Set timeoutlen
vim.opt.splitright = true -- Open new split to the right
vim.opt.splitbelow = true -- Open new split below
vim.opt.list = true -- Show listchars
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Set listchars
vim.opt.inccommand = 'split' -- Show live preview of :s
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 10 -- Set scrolloff
vim.opt.hlsearch = true -- Highlight search results

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
