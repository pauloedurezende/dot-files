local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
}

function M.opts()
  local function get_file_name()
    if vim.bo.filetype == "NvimTree" then
      return "  Explorer"
    else
      return " " .. vim.fn.expand "%:t"
    end
  end

  return {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { get_file_name },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "diagnostics" },
      lualine_z = { "filetype" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
end

function M.config(_, opts)
  require("lualine").setup(opts)
end

return M
