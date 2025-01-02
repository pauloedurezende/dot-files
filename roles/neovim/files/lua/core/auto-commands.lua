-- Creates an autocmd to highlight text when it is yanked (copied).
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = vim.highlight.on_yank,
})

-- Stop Neovim Daemons on ExitPre
vim.api.nvim_create_autocmd('ExitPre', {
  callback = function()
    vim.fn.jobstart(
      vim.fn.expand('~/.config/nvim/scripts/stop-nvim-daemons.sh'),
      { detach = true }
    )
  end,
})
