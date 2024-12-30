return {
  'marko-cerovac/material.nvim',
  name = 'material',
  priority = 1000,
  config = function()
    -- Set the material style to 'darker'
    vim.g.material_style = 'darker'

    -- Apply the colorscheme and check for errors
    local status_ok, _ = pcall(vim.cmd.colorscheme, 'material')
    if not status_ok then
      vim.notify('Failed to load colorscheme: material', vim.log.levels.ERROR)
      return
    end
  end,
}
