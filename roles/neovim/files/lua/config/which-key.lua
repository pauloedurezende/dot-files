return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local which_key = require 'which-key'

    which_key.setup()

    -- Document existing key chains
    which_key.register {
      ['<leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = 'Document', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git Hunk', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = 'File Explorer', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Trouble', _ = 'which_key_ignore' },
    }
    -- visual mode
    which_key.register({
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
