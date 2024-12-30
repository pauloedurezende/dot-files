return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, which_key = pcall(require, 'which-key')
    if not status_ok then
      vim.notify('Failed to load which-key.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for which-key
    local opts = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        ellipsis = "…",
        mappings = false,
      }
    }

    -- Set up which-key with the provided options
    which_key.setup(opts)

    -- Document existing key chains
    which_key.add({
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>h', group = 'Git Hunk' },
      { '<leader>f', group = 'File Explorer' },
      { '<leader>t', group = 'Trouble' },
    })

    -- Visual mode
    which_key.add({
      { '<leader>h', group = 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
