local M = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
}

function M.config()
  local formatters = {
    eslint_d = {},
    prettier = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
        "astro",
      },
      condition = function(utils)
        return utils.root_has_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettier.config.js",
          ".prettier.config.cjs",
          ".prettierrc.toml",
        })
      end,
    },
  }

  local formatting_sources = {}
  for k, v in pairs(formatters) do
    table.insert(formatting_sources, require("null-ls").builtins.formatting[k].with(v))
  end

  require("null-ls").setup({
    border = "rounded",
    sources = formatting_sources,
  })

  require("mason-null-ls").setup({
    ensure_installed = vim.tbl_keys(formatters),
  })
end

return M
