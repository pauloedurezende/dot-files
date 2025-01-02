local M = {}

local function setup_mason()
  require('mason').setup {
    ui = {
      border = 'rounded',
      background = 'normal',
    },
  }
end

local function setup_tool_installer()
  local tools = {
    'emmet_language_server',
    'vtsls',
    'lua_ls',
    'ansiblels',
    'eslint_d',
    'markdownlint',
    'prettierd',
    'ansible_lint',
    'selene',
    'stylua',
  }

  require('mason-tool-installer').setup {
    ensure_installed = tools,
    automatic_installation = false,
  }
end

local function setup_lspconfig_handlers(opts)
  require('mason-lspconfig').setup_handlers {
    function(server_name)
      local server = require('lspconfig')[server_name]
      local merged_configurations = vim.tbl_deep_extend(
        'force',
        { on_attach = opts.on_attach, capabilities = opts.capabilities },
        {}
      )
      server.setup(merged_configurations)
    end,
  }
end

function M.config(opts)
  setup_mason()
  setup_tool_installer()
  setup_lspconfig_handlers(opts)
end

return M
