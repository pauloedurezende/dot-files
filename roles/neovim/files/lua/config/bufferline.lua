local M = {
  "akinsho/bufferline.nvim",
  version = "v2.*"
}

function M.opts()
  return {
    highlights = {
      buffer_selected = {
        italic = false,
      },
    },
    options = {
      show_close_icon = true,
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      offsets = {
        {
          filetype = "NvimTree",
          text = " Explorer",
          highlight = "NvimTreeNormal",
          text_align = "left",
        },
      },
    }
  }
end

function M.config(_, opts)
  require("bufferline").setup(opts)
end

return M
