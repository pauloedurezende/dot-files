return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local which_key = require 'which-key'

    which_key.setup()

    -- Document existing key chains
    which_key.add {
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>h', group = 'Git Hunk' },
      { '<leader>f', group = 'File Explorer' },
      { '<leader>t', group = 'Trouble' },
    }

    -- visual mode
    which_key.add({
      { '<leader>h', group = 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
