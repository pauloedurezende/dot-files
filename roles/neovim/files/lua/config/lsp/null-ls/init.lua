local M = {}

local null_ls = require("null-ls")
local utils = require("null-ls.utils")
local builtins = null_ls.builtins

local sources = {
  builtins.formatting.prettierd,
  builtins.formatting.eslint_d,
  builtins.formatting.shfmt,
  -- builtins.formatting.fixjson,

  -- diagnostics
  builtins.diagnostics.markdownlint,
  builtins.diagnostics.eslint_d,

  -- code actions
  builtins.code_actions.gitsigns,
  builtins.code_actions.eslint_d,
  builtins.code_actions.gitrebase,
  builtins.code_actions.refactoring,

  -- hover
  builtins.hover.dictionary,
}

function M.config(opts)
  null_ls.setup({
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = utils.root_pattern(".git"),
  })
end

return M
