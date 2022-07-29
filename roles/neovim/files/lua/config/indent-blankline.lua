local M = {}

function M.config()
  local indent_blankline = require("indent_blankline");

  local configurations = {
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = { "help", "dashboard", "packer", "NvimTree", "Trouble" },
    char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,

    show_current_context = true
  }

  vim.wo.colorcolumn = "99999"

  indent_blankline.setup(configurations)
end

return M
