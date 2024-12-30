-- Path to lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Check if lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
  -- URL of the lazy.nvim repository
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  
  -- Clone the repository
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  
  -- Check for errors during cloning
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with the specified configuration
require('lazy').setup({
  { import = 'config' },
})
