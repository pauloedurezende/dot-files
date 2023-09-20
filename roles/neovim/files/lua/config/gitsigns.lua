local M = {
  "lewis6991/gitsigns.nvim",
}

function M.opts()
  local icons = require("icons")

  return {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn"
      },
      change = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn"
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn"
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      },
    },
  }
end

function M.config(_, opts)
  require("gitsigns").setup(opts)
end

return M
