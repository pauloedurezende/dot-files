return {
  'stevearc/conform.nvim',
  lazy = false,
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      markdown = { 'markdownlint' },

      javascript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
