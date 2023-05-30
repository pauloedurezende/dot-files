local M = {
  "lukas-reineke/indent-blankline.nvim"
}

function M.opts()
  return {
    show_current_context = false,
    show_current_context_start = false,
    show_trailing_blankline_indent = false,
    filetype_exclude = { "dashboard" },
  }
end

function M.config(_, opts)
  require("indent_blankline").setup(opts)
end

return M
