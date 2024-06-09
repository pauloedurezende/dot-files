local M = {}

function M.config()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local configurations = {
    diagnostic = {
      signs = { active = signs },
      float = {
        focus = false,
        focusable = false,
        border = 'rounded',
      },
    },
    float = { border = 'rounded' },
  }

  vim.diagnostic.config(configurations.diagnostic)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, configurations.float)
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, configurations.float)
end

return M
