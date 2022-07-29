local M = {}

function M.config(servers, options)
  local lspconfig = require("lspconfig")
  local icons = require("config.icons")

  require("mason").setup({
    ui = {
      icons = {
        package_installed = icons.server_installed,
        package_pending = icons.server_pending,
        package_uninstalled = icons.server_uninstalled,
      },
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  })

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      local options = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup { options }
    end,
  })
end

return M
