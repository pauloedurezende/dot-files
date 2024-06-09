return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim' },
  },

  config = function()
    require('neo-tree').setup {}

    vim.api.nvim_set_keymap(
      'n',
      '<leader>fe',
      ':Neotree filesystem reveal left toggle=true<CR>',
      { desc = 'NeoTree Explorer' }
    )

    vim.api.nvim_set_keymap(
      'n',
      '<leader>fg',
      ':Neotree source=git_status position=float toggle=true<CR>',
      { desc = 'NeoTree Git Status' }
    )

    vim.api.nvim_set_keymap(
      'n',
      '<leader>fb',
      ':Neotree source=buffers position=float toggle=true<CR>',
      { desc = 'NeoTree Buffers' }
    )
  end,
}
