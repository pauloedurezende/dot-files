return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    -- Check if the plugin is loaded correctly
    local status_ok, telescope = pcall(require, 'telescope')
    if not status_ok then
      vim.notify('Failed to load telescope.nvim', vim.log.levels.ERROR)
      return
    end

    local actions = require 'telescope.actions'
    local actions_layout = require 'telescope.actions.layout'

    -- Define the configuration options for telescope
    local telescope_options = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
      },
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--no-ignore-vcs',
        },
        file_ignore_patterns = { "node_modules/.*", "dist/.*", "git/.*" },
        mappings = {
          n = {
            ['<M-p>'] = actions_layout.toggle_preview,
          },
          i = {
            ['<M-p>'] = actions_layout.toggle_preview,
            ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
          },
        },
      },
    }

    -- Set up telescope with the provided options
    telescope.setup(telescope_options)

    -- Load telescope extensions
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')

    -- Function to map keys
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'

    -- Custom function for find_files with specific options
    local function find_files()
      builtin.find_files {
        find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs' },
      }
    end

    -- Custom function for live_grep with specific options
    local function live_grep()
      builtin.live_grep {
        additional_args = function(opts)
          return { "--glob", "!node_modules/*", "--glob", "!dist/*" }
        end
      }
    end

    map('n', '<leader>s.', builtin.oldfiles, 'Search Recent Files ("." for repeat)')
    map('n', '<leader>sb', builtin.buffers, 'Search Existing Buffers')
    map('n', '<leader>sd', builtin.diagnostics, 'Search Diagnostics')
    map('n', '<leader>sf', find_files, 'Search Files')
    map('n', '<leader>sg', live_grep, 'Search by Grep')
    map('n', '<leader>sh', builtin.help_tags, 'Search Help')
    map('n', '<leader>sk', builtin.keymaps, 'Search Keymaps')
    map('n', '<leader>sr', builtin.resume, 'Search Resume')
    map('n', '<leader>ss', builtin.builtin, 'Search Select Telescope')
    map('n', '<leader>sw', builtin.grep_string, 'Search current Word')

    -- It's also possible to pass additional configuration options.
    -- See `:help telescope.builtin.live_grep()` for information about particular keys
    map('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, '[S]earch [/] in Open Files')
  end,
}
