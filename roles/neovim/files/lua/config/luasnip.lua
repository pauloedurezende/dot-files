local M = {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
}

function M.config()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return M
