local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "j-hui/fidget.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
}

function M.opts()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    require("config.language-source-protocol.mapping").config(client, bufnr)
    require("config.language-source-protocol.formatters").config(client, bufnr)

    if client.server_capabilities.definitionProvider then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
  end

  local servers = {
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = {
          globals = { "vim" },
        },
        format = {
          enable = true,
          defaultConfig = {
            align_array_table = "none",
          },
        },
      },
    },
  }

  return {
    servers = servers,
    on_attach = on_attach,
    capabilities = capabilities
  }
end

function M.config(_, opts)
  require("config.language-source-protocol.handlers").config()
  require("config.language-source-protocol.installer").config({
    capabilities = opts.capabilities,
    on_attach = opts.on_attach,
    servers = opts.servers,
  })
end

return M
