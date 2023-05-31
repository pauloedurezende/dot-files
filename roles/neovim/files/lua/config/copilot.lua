local M = {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
}

function M.opts()
  return {
    copilot = {
      panel = {
        enabled = false,
        auto_refresh = false,
        layout = {
          position = "bottom",
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
    cmp = {}
  }
end

function M.config(_, opts)
  require("copilot").setup(opts.copilot)
  require("copilot_cmp").setup(opts.cmp)
end

return M
