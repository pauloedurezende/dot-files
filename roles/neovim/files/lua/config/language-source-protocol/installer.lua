local M = {}

function M.config(opts)
  require('mason').setup {}

  require('mason-tool-installer').setup {
    ensure_installed = vim.tbl_keys(opts.servers or {}),
    automatic_installation = false,
  }

  require('mason-lspconfig').setup_handlers {
    function(server_name)
      local server = require('lspconfig')[server_name]

      local configurations = vim.tbl_deep_extend(
        'force',
        { on_attach = opts.on_attach, capabilities = opts.capabilities },
        opts.servers[server_name] or {}
      )

      server.setup(configurations)
    end,
  }
end

return M
