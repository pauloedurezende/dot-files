return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, conform = pcall(require, 'conform')
    if not status_ok then
      vim.notify('Failed to load conform.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for conform
    local conform_options = {
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'markdownlint' },
        javascript = { 'prettierd', 'eslint_d' },
        javascriptreact = { 'prettierd', 'eslint_d' },
        typescript = { 'prettierd', 'eslint_d' },
        typescriptreact = { 'prettierd', 'eslint_d' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    -- Set up the plugin with the provided options
    conform.setup(conform_options)
  end,
}
