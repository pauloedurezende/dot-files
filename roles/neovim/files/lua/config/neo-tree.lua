return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim' },
  },
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, neotree = pcall(require, 'neo-tree')
    if not status_ok then
      vim.notify('Failed to load neo-tree.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for neo-tree
    local neotree_options = {
      filesystem = {
        filtered_items = {
          visible = true, -- This will show hidden files by default
          hide_dotfiles = false, -- This will show dotfiles
          hide_gitignored = false, -- This will show files ignored by git
        },
      },
    }

    -- Set up neo-tree with the provided options
    neotree.setup(neotree_options)

    -- Function to map keys
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Key mappings for neo-tree
    map('n', '<leader>fe', ':Neotree filesystem reveal left toggle=true<CR>', { desc = 'NeoTree Explorer' })
    map('n', '<leader>fg', ':Neotree source=git_status position=float toggle=true<CR>', { desc = 'NeoTree Git Status' })
    map('n', '<leader>fb', ':Neotree source=buffers position=float toggle=true<CR>', { desc = 'NeoTree Buffers' })
  end,
}
