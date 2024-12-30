return {
  'numToStr/Comment.nvim',
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, comment = pcall(require, 'Comment')
    if not status_ok then
      vim.notify('Failed to load Comment.nvim', vim.log.levels.ERROR)
      return
    end

    -- Set up the plugin with default options
    comment.setup()
  end,
}
