return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function(_, opts)
    -- Check if the plugin is loaded correctly
    local status_ok, ibl = pcall(require, 'ibl')
    if not status_ok then
      vim.notify('Failed to load indent-blankline.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for indent-blankline
    local ibl_options = {
      whitespace = {
        remove_blankline_trail = false,
      },
      exclude = {
        filetypes = { 'dashboard' },
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    }

    -- Set up the plugin with the provided options
    ibl.setup(ibl_options)
  end,
}
