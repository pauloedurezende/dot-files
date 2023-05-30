local M = {}

function M.config(opts)
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(opts.servers),
  })

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = opts.capabilities,
        on_attach = opts.on_attach,
        settings = opts.servers[server_name],
      })
    end,
  })
end

return M
