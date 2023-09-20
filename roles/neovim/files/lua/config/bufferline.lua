local M = {
  "akinsho/bufferline.nvim",
  version = "v2.*"
}

function M.opts()
  local icons = require("icons")

  return {
    highlights = {
      buffer_selected = {
        italic = false,
      },
    },
    options = {
      show_close_icon = true,
      buffer_close_icon = icons.ui.Close,
      modified_icon = icons.ui.Circle,
      close_icon = icons.ui.BoldClose,
      left_trunc_marker = icons.ui.ArrowCircleLeft,
      right_trunc_marker = icons.uiArrowCircleRight,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
    }
  }
end

function M.config(_, opts)
  require("bufferline").setup(opts)
end

return M
