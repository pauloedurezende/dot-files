return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.bufremove').setup()
    require('mini.indentscope').setup { symbol = '│', options = { try_as_border = true } }
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
