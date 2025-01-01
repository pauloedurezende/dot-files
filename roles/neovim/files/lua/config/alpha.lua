return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    -- Check if the plugin is loaded corretamente
    local status_ok, alpha = pcall(require, 'alpha')
    if not status_ok then
      vim.notify('Failed to load alpha-nvim', vim.log.levels.ERROR)
      return
    end

    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.header.val = {
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠉⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠓⢄⠀⠀⠀⠙⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⢀⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠈⠹⢦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⣀⣠⣤⣴⣶⣶⣶⣾⣟⠟⠀⠀⠠⠃⢠⠎⠀⠀⠀⣰⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠑⣟⢿⣷⣶⣶⣶⣤⣤⣀⠀',
      '⠀⠸⣿⣿⣿⣿⣿⡿⢻⠋⠀⠀⠀⠁⡰⠃⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢶⡀⠀⠀⠀⠈⢺⠛⣿⣿⣿⣿⣿⣿⠃',
      '⠀⠀⢿⣿⣿⣿⡿⢳⠃⢀⡀⠀⠀⡼⠁⠠⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⡀⠀⠑⠄⠀⠳⡛⢿⣿⣿⣿⡟⠀',
      '⠀⠀⢸⣿⣿⣿⣤⡇⠃⠀⠀⠀⢰⠃⠀⢡⡎⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢱⡄⠀⠀⠀⠀⢱⢸⣿⣿⣿⠃⠀',
      '⠀⠀⠀⣿⣿⢫⡟⠸⠀⠀⠀⠀⡏⠀⠀⡎⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⣄⢯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠈⢦⠀⠀⢫⡹⣿⡟⠀⠀',
      '⠀⠀⠀⢸⣿⣿⠁⣏⠀⠀⠀⢸⠁⠀⡸⠀⠀⣼⠟⡇⠀⠀⠀⠀⠀⠀⠘⣼⡆⠀⠀⠈⣧⠀⠀⠀⠀⠀⠘⡆⠀⠀⢧⠀⠀⢻⣿⠃⠀⠀',
      '⠀⠀⠀⠀⣿⠇⠀⠮⠀⠀⠀⡏⠀⠀⡇⠀⡰⠧⠤⠼⡀⢰⠀⠀⠀⠀⠀⠸⣿⣦⠀⠀⠘⣧⡀⠀⠀⠀⠀⠹⡀⠀⠸⡄⠀⠈⢿⣄⠀⠀',
      '⠀⠀⠀⢠⡟⡄⠀⡳⠀⠀⢰⠇⠀⣼⠁⡰⢁⣀⣀⠀⠹⡄⢣⠀⠀⠀⠀⠀⠙⣌⠛⠦⡀⠱⡙⢦⡀⠀⢣⠀⢣⠀⠀⢇⠀⠈⢏⣏⠛⢖',
      '⠀⠀⢠⢳⠃⡇⠀⢑⠀⠀⢸⠀⡜⢉⣦⣯⡵⠶⢦⣌⠐⠜⢄⠳⣄⡀⠀⠀⠀⠈⢲⣈⣭⣵⣿⣑⠳⣄⠈⡇⠘⡆⠀⢸⠀⠀⢸⠘⡆⠀',
      '⠀⣠⠃⡞⠀⢱⠀⢸⠀⠀⢸⡜⢠⣿⠟⢁⠐⢿⣷⣌⢳⡀⠀⠑⠸⠯⠉⠑⠒⢢⡟⠁⠘⣿⣶⡍⠻⣬⡷⣧⠀⢳⠀⠨⡄⠀⢈⠆⢹⡀',
      '⡜⠁⣼⠇⠀⠈⡆⠈⡆⠀⢸⠐⣾⠃⠀⣿⡖⣶⡽⣿⠀⣧⠀⠀⠀⠀⠀⠀⠀⣾⠀⣷⣶⣷⣹⣿⠀⢹⡾⢾⢀⣾⡀⠀⡇⠀⢸⠀⠀⢣',
      '⣠⡾⢼⡁⠀⠀⠹⡄⢱⠀⢸⠐⣻⠀⠀⣿⣏⣿⣧⢿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠈⠘⣿⢿⣿⢿⣻⠀⠀⡷⠞⠉⣯⡇⢀⡇⠀⣸⠀⠀⠘',
      '⣿⡝⣾⠀⠀⠀⠀⢳⠈⢇⠸⡀⠹⡄⠀⠘⢇⣐⡨⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣔⣂⡸⠃⠀⢸⠓⠂⢰⢿⡇⢰⠀⢀⡇⠀⠀⠀',
      '⣷⣛⣼⠀⠀⠀⠀⠀⠣⡈⢆⢇⠀⠈⠢⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡄⠋⠁⢀⡷⢫⣗⡸⠀⡼⠀⠀⠀⠀',
      '⢷⣝⣾⡄⠀⠀⠀⠀⠀⠑⣌⢾⡀⠀⠀⠀⠀⠀⠀⣠⡖⠒⠒⠒⠒⠒⠒⠒⠦⠤⣄⠀⠀⠁⠁⠀⠀⠀⡜⠛⣫⣷⠃⡼⠁⠀⠀⠀⠀',
      '⠸⣿⣸⣇⠀⠀⠀⠀⠀⠀⠀⢣⣇⠀⠀⠀⠀⠀⢸⣿⡿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠿⣿⡇⠀⠀⠀⠀⠀⢸⣧⢿⢿⡟⡸⠃⠀⠀⠀⠀⢀',
      '⣧⠘⢿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠁⠀⠀⠀⠀⢠⡿⣼⡹⣾⡟⠁⠀⠀⠀⠀⠀⢸',
      '⠈⠁⠈⠻⡽⡄⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀⠓⢦⡀⠀⠀⠀⠀⠀⢀⡠⠞⠁⠀⠀⠀⢀⣴⣟⡳⢧⣻⡽⠀⠀⠀⠀⠀⠀⢀⡯',
      '⣿⣶⣤⣄⣹⡽⣆⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⡀⠀⠀⠀⠀⠈⠓⠒⠒⠒⠚⠉⠀⠀⠀⢀⣠⣴⢯⡳⣞⣿⣷⣹⡇⠀⠀⠀⠀⠀⢀⣾⢳',
      '⣿⣿⣿⣿⣿⣿⣯⠷⣄⠀⠀⠀⠀⠀⠀⠀⠹⣿⣷⣒⣦⢤⣤⣠⣀⣄⣠⣤⣤⣴⣶⢻⡽⣻⣮⣗⣻⢼⣻⡟⢾⡇⠀⠀⠀⠀⢀⡾⣭⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣽⣳⢦⣀⠀⠀⠀⠀⠀⠹⡏⠁⠉⠓⠦⣉⡉⠛⣙⣩⠵⢚⠩⠳⣽⣽⣼⣿⣾⣷⣷⣿⣿⠆⠀⠀⠀⣠⣾⣻⣾⣿',
    }

    -- Get the current date
    local function get_current_date()
      return os.date('%A, %B %d, %Y')
    end

    -- Get the number of plugins loaded
    local function get_plugins_count()
      local lazy = require('lazy')
      return lazy.stats().count
    end

    dashboard.section.footer.val = {
      '',
      'Today is ' .. get_current_date() .. ' | Loaded ' .. get_plugins_count() .. ' plugins',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    -- Set up alpha with the provided options
    alpha.setup(dashboard.opts)
  end,
}
