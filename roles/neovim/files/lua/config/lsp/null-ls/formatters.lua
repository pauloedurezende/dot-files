local M = {}

local sources = require("null-ls.sources")
local FORMATTING = require("null-ls").methods.FORMATTING

function M.format()
  local view = vim.fn.winsaveview()
  vim.lsp.buf.format {
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
  }
  vim.fn.winrestview(view)
end

function M.config(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  local enable = false
  if M.has_formatter(filetype) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  client.server_capabilities.documentFormattingProvder = enable
  client.server_capabilities.documentRangeFormattingProvider = enable

  if client.server_capabilities.documentFormattingProvider then
    local lsp_format_grp = vim.api.nvim_create_augroup("LspFormat", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.schedule(M.format)
      end,
      group = lsp_format_grp,
      buffer = bufnr,
    })
  end
end

function M.has_formatter(filetype)
  local available = sources.get_available(filetype, FORMATTING)
  return #available > 0
end

return M
