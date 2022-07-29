local M = {}

local icons = require("config.icons")

function M.config()
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local configurations = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    diagnostic = {
      virtual_text = { spacing = 4, prefix = " ●" },
      signs = {
        active = signs,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
  }

  vim.diagnostic.config(configurations.diagnostic)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, configurations.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, configurations.float)
end

return M
