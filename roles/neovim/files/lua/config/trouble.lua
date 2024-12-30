return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, trouble = pcall(require, 'trouble')
    if not status_ok then
      vim.notify('Failed to load trouble.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for trouble
    local opts = {}

    -- Set up trouble with the provided options
    trouble.setup(opts)

    -- Function to map keys
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end

    -- Key mappings for trouble
    map('n', '<leader>td', '<cmd>Trouble diagnostics toggle<cr>', 'Diagnostics')
    map('n', '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', 'Buffer Diagnostics')
    map('n', '<leader>ts', '<cmd>Trouble symbols toggle focus=false<cr>', 'Symbols')
    map('n', '<leader>tl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', 'LSP Definitions & References')
    map('n', '<leader>tL', '<cmd>Trouble loclist toggle<cr>', 'Location List')
    map('n', '<leader>tQ', '<cmd>Trouble qflist toggle<cr>', 'Quick Fix List')
  end,
}
