return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, lualine = pcall(require, 'lualine')
    if not status_ok then
      vim.notify('Failed to load lualine.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for lualine
    local lualine_options = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'dashboard', 'NvimTree', 'Outline' },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'diagnostics' },
        lualine_z = { 'filetype' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }

    -- Set up lualine with the provided options
    lualine.setup(lualine_options)
  end,
}
