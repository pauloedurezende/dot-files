return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    highlights = {
      buffer_selected = {
        italic = false,
      },
    },
    options = {
      show_close_icon = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = " Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.api.nvim_set_keymap('n', '[b', ':BufferLineCyclePrev<CR>', { desc = "Previous Buffer" })
    vim.api.nvim_set_keymap('n', ']b', ':BufferLineCycleNext<CR>', { desc = "Next Buffer" })
  end
}
