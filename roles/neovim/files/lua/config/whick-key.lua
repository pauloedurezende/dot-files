local M = {
  "folke/which-key.nvim",
}

function M.opts()
  local normal = {
    -- Improve navigation between windows
    ["<C-h>"] = { "<C-w>h", "Navigate to the buffer (left)" },
    ["<C-j>"] = { "<C-w>j", "Navigate to the buffer (down)" },
    ["<C-k>"] = { "<C-w>k", "Navigate to the buffer (top)" },
    ["<C-l>"] = { "<C-w>l", "Navigate to the buffer (right)" },

    -- Resize the window with arrows
    ["<C-Up>"] = { ":resize -2<CR>", "Resize buffer (top)" },
    ["<C-Down>"] = { ":resize +2<CR>", "Resize buffer (down)" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize buffer (left)" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize buffer (right)" },

    -- Navigate between buffers
    ["<S-l>"] = { ":bnext<CR>", "Navigate to the buffer tab (left)" },
    ["<S-h>"] = { ":bprevious<CR>", "Navigate to the buffer tab (right)" },

    -- Telescope
    ["<leader>f"] = { name = "Find" },
    ["<leader>ff"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
    ["<leader>fb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    ["<leader>fh"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    ["<leader>fm"] = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
    ["<leader>fo"] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Previously Open Files" },
    ["<leader>fg"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    ["<leader>fc"] = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
    ["<leader>fw"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
    ["<leader>ft"] = { "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colorscheme" },

    -- File Explorer
    ["<leader>e"] = { "<cmd>lua require('nvim-tree.api').tree.toggle()<cr>", "Explorer" },

    -- Lazy
    ["<leader>l"] = { name = "Lazy" },
    ["<leader>lc>"] = { "<cmd>lua require('lazy').clear()<cr>", "Clear" },
    ["<leader>ld>"] = { "<cmd>lua require('lazy').debug()<cr>", "Debug" },
    ["<leader>lh>"] = { "<cmd>lua require('lazy').home()<cr>", "Home" },


    -- Git
    ["<leader>g"] = { name = "Git" },
    ["<leader>go"] = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Changed Files" },

    -- Git Hunk
    ["<leader>gh"] = { name = "Hunk" },
    ["<leader>ghs"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage" },
    ["<leader>ghr"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset" },
    ["<leader>ghu"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo" },
    ["<leader>ghp"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview" },
    ["<leader>ghS"] = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Buffer Stage" },
    ["<leader>ghR"] = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Buffer Reset" },
    ["<leader>ghb"] = { "<cmd>lua require('gitsigns').blame_line({ full=true })<cr>", "Blame" },

    -- Git Diff
    ["<leader>gd"] = { name = "Diff" },
    ["<leader>gdt"] = { "<cmd>lua require('gitsigns').diffthis()<cr>", "This" },
    ["<leader>gdf"] = { "<cmd>lua require('gitsigns').diffthis('~')<cr>", "Full" },

    -- Git Toggle
    ["<leader>gt"] = { name = "Toggle" },
    ["<leader>gtl"] = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", "Line" },
    ["<leader>gtd"] = { "<cmd>lua require('gitsigns').toggle_deleted()<cr>", "Deleted" },

    -- Git Checkout
    ["<leader>gc"] = { name = "Checkout" },
    ["<leader>gcb"] = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branch" },
    ["<leader>gcc"] = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commit" },

    -- LSP
    ["<leader>of"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open Float" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "GoTo Previous" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "GoTo Next" },
    ["<leader>qf"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  }

  return {
    mappings = {
      normal = normal,
    },
    configurations = {
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    }
  }
end

function M.config(_, opts)
  local which_key = require("which-key")

  which_key.register(opts.mappings.normal, { mode = "n" })

  which_key.setup(opts.configurations)
end

return M
