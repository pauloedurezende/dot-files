local M = {}

function M.config(opts)
  require('mason').setup {
    ui = {
      border = 'rounded',
      background = 'normal',
    },
  }

  local tools = {
    -- LSPs
    'emmet_language_server',
    'tsserver',
    'lua_ls',
    'ansiblels',

    -- Linters & Formatters
    'eslint_d',
    'markdownlint',
    'prettierd',
    'ansible_lint',
    'selene',
    'stylua'
  }

  require('mason-tool-installer').setup {
    ensure_installed = tools,
    automatic_installation = false,
  }

  require('mason-lspconfig').setup_handlers {
    function(server_name)
      local server = require('lspconfig')[server_name]

      local default_configs = { on_attach = opts.on_attach, capabilities = opts.capabilities }
      local server_specific_configs = {}
      local merged_configurations = vim.tbl_deep_extend('force', default_configs, server_specific_configs)

      server.setup(merged_configurations)
    end,
  }
end

return M
