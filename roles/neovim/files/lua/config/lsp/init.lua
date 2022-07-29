local M = {}

local servers = {
  ansiblels = {},
  cssls = {},
  cssmodules_ls = {},
  dockerls = {},
  emmet_ls = {},
  graphql = {},
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    setup = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
          end,
        },
      },
    },
  },
  tailwindcss = {},
  terraformls = {},
  tflint = {},
  tsserver = { disable_formatting = true },
  yamlls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
        completion = { callSnippet = "Both" },
        telemetry = { enable = false },
      },
    },
  },
}

function M.on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  require("config.lsp.keymaps").config(client, bufnr)
  require("config.lsp.highlighter").config(client, bufnr)
  require("config.lsp.null-ls.formatters").config(client, bufnr)

  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local options = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("config.lsp.handlers").config()

function M.config()
  require("config.lsp.null-ls").config(options)
  require("config.lsp.installer").config(servers, options)
end

return M
