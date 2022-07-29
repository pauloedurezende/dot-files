local M = {}

function M.config()
  local neogen = require("neogen")

  local configurations = {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      javascriptreact = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
      typescriptreact = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    },
  }

  neogen.setup(configurations)
end

return M
