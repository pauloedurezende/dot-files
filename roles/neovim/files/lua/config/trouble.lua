return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    {
      '<leader>tx',
      function()
        require('trouble').toggle()
      end,
      desc = '[T]rouble Toggle',
    },
    {
      '<leader>tw',
      function()
        require('trouble').toggle 'workspace_diagnostics'
      end,
      desc = '[T]rouble [W]orkspace diagnostics',
    },
    {
      '<leader>td',
      function()
        require('trouble').toggle 'document_diagnostics'
      end,
      desc = '[T]rouble [D]ocument diagnostics',
    },
    {
      '<leader>tq',
      function()
        require('trouble').toggle 'quickfix'
      end,
      desc = '[T]rouble [Q]uickfix',
    },
    {
      '<leader>tl',
      function()
        require('trouble').toggle 'loclist'
      end,
      desc = '[T]rouble [L]ocklist',
    },
  },
}
