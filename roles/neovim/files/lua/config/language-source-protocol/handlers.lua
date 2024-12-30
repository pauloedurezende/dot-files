local M = {}

local function define_signs()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end
end

local function configure_diagnostics()
  local diagnostic_config = {
    signs = { active = true },
    float = {
      focus = false,
      focusable = false,
      border = 'rounded',
    },
  }

  vim.diagnostic.config(diagnostic_config)
end

local function configure_handlers()
  local float_config = { border = 'rounded' }

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)
end

function M.config()
  define_signs()
  configure_diagnostics()
  configure_handlers()
end

return M
