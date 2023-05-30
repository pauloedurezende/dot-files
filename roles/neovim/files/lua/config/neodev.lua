local M = {
  "folke/neodev.nvim",
}

function M.opts()
  return {
    library = {
      plugins = { "nvim-dap-ui" },
      types = true,
    }
  }
end

function M.config(_, opts)
  require("neodev").setup(opts)
end

return M
