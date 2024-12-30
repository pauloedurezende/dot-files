return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, lint = pcall(require, 'lint')
    if not status_ok then
      vim.notify('Failed to load nvim-lint', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for linters
    local lint_options = {
      linters_by_ft = {
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        markdown = { 'markdownlint' },
        lua = { 'selene' },
        yaml = { 'ansible_lint' },
      }
    }

    -- Set up linters
    lint.linters_by_ft = lint_options.linters_by_ft

    -- Set up autocommands for linting
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
