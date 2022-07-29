local g = vim.g;
local api = vim.api;

local opts = { noremap = true, silent = true }

-- Leader key
g.mapleader = ','
g.maplocalleader = ','

-- [NORMAL] -- Improve navigation between windows
api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- [NORMAL] -- Resize the window with arrows
api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- [NORMAL] -- Navigate between buffers
api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- [NORMAL] -- Move selected text up and down
api.nvim_set_keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
api.nvim_set_keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- [INSERT] -- Press `jk` to exit `insert` mode
api.nvim_set_keymap("i", "jk", "<ESC>", opts)

-- [VISUAL] -- Indent selected text
api.nvim_set_keymap("v", "<", "<gv", opts)
api.nvim_set_keymap("v", ">", ">gv", opts)

-- [VISUAL] -- Move selected text up and down
api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
api.nvim_set_keymap("v", "p", '"_dP', opts)

-- [VISUAL BLOCK] -- Move selected text up and down
api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
