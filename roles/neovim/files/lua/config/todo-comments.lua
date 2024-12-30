return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, todo_comments = pcall(require, 'todo-comments')
    if not status_ok then
      vim.notify('Failed to load todo-comments.nvim', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for todo-comments
    local todo_comments_options = {
      signs = false,
    }

    -- Set up todo-comments with the provided options
    todo_comments.setup(todo_comments_options)
  end,
}
