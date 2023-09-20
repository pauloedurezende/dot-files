local M = {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
}

function M.opts()
  local icons = require("icons")

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
          default = icons.ui.Text,
          symlink = icons.ui.FileSymlink,
          bookmark = icons.ui.BookMark,
          folder = {
            arrow_closed = icons.ui.TriangleShortArrowRight,
            arrow_open = icons.ui.TriangleShortArrowDown,
            default = icons.ui.Folder,
            open = icons.ui.FolderOpen,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            symlink = icons.ui.FolderSymlink,
            symlink_open = icons.ui.FolderOpen,
          },
          git = {
            unstaged = icons.git.FileUnstaged,
            staged = icons.git.FileStaged,
            unmerged = icons.git.FileUnmerged,
            renamed = icons.git.FileRenamed,
            untracked = icons.git.FileUntracked,
            deleted = icons.git.FileDeleted,
            ignored = icons.git.FileIgnored,
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
