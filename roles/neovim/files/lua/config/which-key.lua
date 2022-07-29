local M = {}

function M.config()
  local which_key = require("which-key")

  local configurations = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    key_labels = {},
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    window = {
      border = "none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }

  local options = {
    normal = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    },
    visual = {
      mode = "v",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    },
  }

  local function normal()
    local mapping = {
      w = { "<cmd>write!<cr>", "Save" },
      q = { "<cmd>quit!<cr>", "Quit" },
      e = { "<cmd>lua require('nvim-tree').toggle()<cr>", "Explorer" },
      f = {
        name = "Find",
        f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true, file_ignore_patterns = { '.git', 'node_modules' } })<cr>",
          "Files" },
        b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
        m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
        o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Previously Open Files" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
        c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
        w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
        t = { "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colorscheme" },
      },
      b = {
        name = "Buffer",
        c = { "<cmd>lua require('close_buffers').delete({ type = 'this' })<cr>", "Delete Current Buffer" },
        C = { "<cmd>lua require('close_buffers').delete({ type = 'this', force = true })<cr>",
          "Force Delete Current Buffer" },
        D = { "<cmd>lua require('close_buffers').wipe({ type = 'all', force = true })<cr>", "Wipe All Buffers" },
        s = { "<cmd>BufferLinePick<cr>", "Select Buffer" },
        p = { "<cmd>BufferLinePickClose<cr>", "Close Buffer" },
      },
      d = {
        name = "Documentation",
        f = { "<cmd>lua require('neogen').generate({ type = 'func' })<cr>", "Function" },
        c = { "<cmd>lua require('neogen').generate({ type = 'class' })<cr>", "Class" },
        t = { "<cmd>lua require('neogen').generate({ type = 'type' })<cr>", "Type" },
      },
      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      g = {
        name = "Git",
        g = { "<cmd>lua lazygit_toggle()<cr>", "lazygit" },
        o = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Changed Files" },
        h = {
          name = "Hunk",
          s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage" },
          r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset" },
          u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo" },
          p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview" },
          S = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Buffer Stage" },
          R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Buffer Reset" },
        },
        b = { "<cmd>lua require('gitsigns').blame_line({ full=true })<cr>", "Blame" },
        d = {
          name = "Diff",
          t = { "<cmd>lua require('gitsigns').diffthis()<cr>", "This" },
          f = { "<cmd>lua require('gitsigns').diffthis('~')<cr>", "Full" }
        },
        t = {
          name = "Toggle",
          l = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", "Line" },
          d = { "<cmd>lua require('gitsigns').toggle_deleted()<cr>", "Deleted" }
        },
        c = {
          name = "Checkout",
          b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branch" },
          c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commit" },
        },
      },
      r = {
        name = "Refactoring",
        b = { "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", "Extract Block" },
        B = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>", "Extract Block To File" },
      },
    }

    which_key.register(mapping, options.normal)
  end

  local function visual()
    local mapping = {
      r = {
        name = "Refactoring",
        e = { "<cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function" },
        f = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", "Extract Function To File" },
        v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>", "Extract Variable" },
        i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
      }
    }

    which_key.register(mapping, options.visual)
  end

  which_key.setup(configurations)

  normal()
  visual()
end

return M
