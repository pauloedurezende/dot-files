return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {},
      color_overrides = {},
      highlight_overrides = {
        all = function(colors)
          return {
            NormalFloat = { bg = colors.none },
          }
        end,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
