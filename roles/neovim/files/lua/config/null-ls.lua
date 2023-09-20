local M = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
}

function M.opts()
  local null_ls = require("null-ls")

  return {
    sources = {
      -- formatters
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.eslint_d,

      -- Diagnostic
      null_ls.builtins.diagnostics.eslint_d,

      -- CodeAction
      null_ls.builtins.code_actions.eslint_d,
    }
  }
end

function M.config(_, opts)
  require("null-ls").setup({
    border = "rounded",
    sources = opts.sources,
  })

  require("mason-null-ls").setup({
    ensure_installed = {
      "prettierd",
      "eslint_d"
    }
  })
end

return M
