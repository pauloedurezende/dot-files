local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.opts()
  return {}
end

function M.config(_, opts)
  require("todo-comments").setup(opts)
end

return M
