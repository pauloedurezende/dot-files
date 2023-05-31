local M = {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
}

function M.opts()
  return {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = true,
    hijack_cursor = true,
    update_cwd = true,
    renderer = {
      root_folder_label = false,
      root_folder_modifier = table.concat { ":t:gs?$?/", string.rep(" ", 1000), "?:gs?^??" },
      highlight_opened_files = "all",
      highlight_git = true,
      add_trailing = true,
      special_files = {},
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            deleted = "",
            ignored = "◌",
            renamed = "➜",
            staged = "✓",
            unmerged = "",
            unstaged = "",
            untracked = "",
          },
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "󱧮",
          },
        },
      },
    },
    git = {
      enable = true,
      ignore = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    view = {
      adaptive_size = true,
      side = "left",
      width = 32,
    },
  }
end

function M.config(_, opts)
  require("nvim-tree").setup(opts)
end

return M
