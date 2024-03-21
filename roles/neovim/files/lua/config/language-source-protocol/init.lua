return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local servers = require 'config.language-source-protocol.servers'

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local function on_attach(client, bufnr)
      require('config.language-source-protocol.mappings').config(client, bufnr)
      require('config.language-source-protocol.highlight').config(client, bufnr)
    end

    require('config.language-source-protocol.handlers').config()

    require('config.language-source-protocol.installer').config {
      capabilities = capabilities,
      on_attach = on_attach,
      servers = servers,
    }
  end,
}
