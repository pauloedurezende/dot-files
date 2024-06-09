return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim',                  config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { 'jay-babu/mason-null-ls.nvim' },

    { 'j-hui/fidget.nvim',                        opts = {} },
    { 'folke/neodev.nvim',                        opts = {} },

    { 'nvimtools/none-ls.nvim' },
  },
  config = function()
    local cmp_lsp = require 'cmp_nvim_lsp'

    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_capabilities = cmp_lsp.default_capabilities()
    local capabilities = vim.tbl_deep_extend('force', {}, client_capabilities, cmp_capabilities)

    local function on_attach(client, bufnr)
      require('config.language-source-protocol.handlers').config()

      require('config.language-source-protocol.mappings').config(client, bufnr)
      require('config.language-source-protocol.highlight').config(client, bufnr)
    end

    require('config.language-source-protocol.installer').config {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
}
