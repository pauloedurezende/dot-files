local M = {}

function M.config()
  local icons = require("icons")

  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.BoldInformation },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.BoldQuestion },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local configurations = {
    diagnostic = {
      signs = {
        active = signs,
      },
      float = {
        focus = false,
        focusable = false,
        border = "rounded",
      }
    },
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
  }

  vim.diagnostic.config(configurations.diagnostic)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, configurations.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, configurations.float)
end

return M
