local M = {}

function M.config()
  local autopairs = require("nvim-autopairs")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")

  local configurations = {
    check_ts = true,
    ts_config = {
      javascript = { "string", "template_string" },
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
    },
  }

  autopairs.setup(configurations)

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

return M
