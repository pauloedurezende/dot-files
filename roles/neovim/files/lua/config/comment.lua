local M = {
  "numToStr/Comment.nvim"
}

function M.opts()
  return {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
end

function M.config(_, opts)
  require("Comment").setup(opts)
end

return M
