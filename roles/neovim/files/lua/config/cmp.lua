return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
  },
  config = function()
    -- Load required modules
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
      vim.notify("Failed to load nvim-cmp", vim.log.levels.ERROR)
      return
    end

    local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
    if not luasnip_status_ok then
      vim.notify("Failed to load LuaSnip", vim.log.levels.ERROR)
      return
    end

    -- Function to expand snippets
    local function expand_snippet(args)
      luasnip.lsp_expand(args.body)
    end

    -- Define the configuration options for cmp
    local cmp_options = {
      snippet = {
        expand = expand_snippet,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-y>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm {
                select = true,
              }
            end
          else
            fallback()
          end
        end),

        ['<C-l>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-h>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      }),
    }

    -- Setup cmp with the defined options
    cmp.setup(cmp_options)
  end,
}
