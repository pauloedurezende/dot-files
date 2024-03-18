return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = function()
    local bufremove = require 'mini.bufremove'

    return {
      options = {
        close_command = function(buf_id)
          bufremove.delete(buf_id, false)
        end,
        right_mouse_command = function(buf_id)
          bufremove.delete(buf_id, false)
        end,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
  end,
  keys = {
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle [B]uffer [P]in' },
    { '<leader>bu', '<cmd>BufferLineGroupClose ungrouped<cr>', desc = 'Remove [B]uffer [U]npinned' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close all [O]ther [B]uffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = 'Close [B]uffers to the [R]ight' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = 'Close [B]uffers to the [L]eft' },

    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Go to previous [B]uffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Go to next [B]uffer' },
  },
}
