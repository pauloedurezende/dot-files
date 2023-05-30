local M = {
  "folke/zen-mode.nvim",
}

function M.opts()
  return {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {},
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      kitty = {
        enabled = false,
        font = "+4",
      },
    },
    on_open = function() end,
    on_close = function() end,
  }
end

function M.config(_, opts)
  require("zen-mode").setup(opts)
end

return M
