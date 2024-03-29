return {
  'echasnovski/mini.nvim',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    require('mini.bufremove').setup()
    require('mini.surround').setup()

    require('mini.ai').setup { n_lines = 500 }

    local indentscope = require 'mini.indentscope'
    indentscope.setup {
      symbol = '│',
      options = { try_as_border = true },
      draw = { animation = indentscope.gen_animation.none() },
    }

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
