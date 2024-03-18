return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {},
  keys = function()
    local command = require 'neo-tree.command'

    return {
      {
        '<leader>fe',
        function()
          command.execute { toggle = true, reveal = true, dir = vim.loop.cwd() }
        end,
        desc = 'Toggle [F]ile [E]xplorer',
      },

      {
        '<leader>fg',
        function()
          command.execute { source = 'git_status', toggle = true }
        end,
        desc = 'Toggle [F]ile explorer with [G]it status',
      },

      {
        '<leader>fb',
        function()
          command.execute { source = 'buffers', toggle = true }
        end,
        desc = 'Toggle [F]ile explorer with [B]uffers',
      },
    }
  end,
}
