local M = {}

function M.config()
  local comment = require("Comment")

  local configurations = {
    sticky = true,
    ignore = nil,
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },
    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
    pre_hook = function(ctx)
      -- Only calculate commentstring for tsx filetypes
      if vim.bo.filetype == "typescriptreact" then
        local utils = require("Comment.utils")

        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == utils.ctype.line and "__default" or "__multiline"

        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == utils.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
          key = type,
          location = location,
        })
      end
    end,
    post_hook = nil
  }

  comment.setup(configurations)
end

return M
