local M = {}

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local neogen = require("neogen")
  local icons = require("config.icons").lsp

  local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local configurations = {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif neogen.jumpable(true) then
          neogen.jump_prev()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
        })[entry.source.name]
        return vim_item
      end
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "luasnip" },
      { name = "buffer" },
    })
  }

  cmp.setup(configurations)
end

return M
