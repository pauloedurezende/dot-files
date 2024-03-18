return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    {
      '<leader>sR',
      function()
        require('spectre').toggle()
      end,
      desc = '[S]earch and [R]eplace',
    },
  },
}
