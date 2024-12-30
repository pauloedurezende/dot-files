return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Dependency for icons
  },
  config = function()
    -- Check if the bufferline module is available
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
      return
    end

    -- Bufferline configurations
    local bufferline_options = {
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
    }

    -- Setup bufferline with the defined options
    bufferline.setup(bufferline_options)

    -- Define key mappings for buffer navigation
    vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { desc = "Previous Buffer" })
    vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { desc = "Next Buffer" })
    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Delete Current Buffer" })
  end
}
