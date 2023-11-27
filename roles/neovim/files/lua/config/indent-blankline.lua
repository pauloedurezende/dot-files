local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl"
}

function M.opts()
  return {}
end

function M.config(_, opts)
  require("ibl").setup(opts)
end

return M
