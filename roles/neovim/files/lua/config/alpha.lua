return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      '           ▄ ▄                   ',
      '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
      '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
      '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
      '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
      '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
      '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
      '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
      '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Find File', ':Telescope find_files<CR>'),
      dashboard.button('r', '󰈚  Recent Files', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
      dashboard.button('q', '󰗼  Quit NVIM', ':qa<CR>'),
    }

    dashboard.section.footer.opts.hl = 'Type'
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}
