return {
  'echasnovski/mini.nvim',
  config = function()
    -- Check if the mini modules are loaded correctly
    local status_ai, mini_ai = pcall(require, 'mini.ai')
    if not status_ai then
      vim.notify('Failed to load mini.ai', vim.log.levels.ERROR)
      return
    end

    local status_surround, mini_surround = pcall(require, 'mini.surround')
    if not status_surround then
      vim.notify('Failed to load mini.surround', vim.log.levels.ERROR)
      return
    end

    local status_pairs, mini_pairs = pcall(require, 'mini.pairs')
    if not status_pairs then
      vim.notify('Failed to load mini.pairs', vim.log.levels.ERROR)
      return
    end

    -- Define the configuration options for mini modules
    local mini_ai_options = { n_lines = 500 }
    local mini_surround_options = {}
    local mini_pairs_options = {}

    -- Set up mini modules with the provided options
    mini_ai.setup(mini_ai_options)
    mini_surround.setup(mini_surround_options)
    mini_pairs.setup(mini_pairs_options)
  end,
}
