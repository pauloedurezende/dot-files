local M = {}

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

  local should_format_on_save = false

  if M.has_formatter(filetype) then
    should_format_on_save = client.name == "null-ls"
  else
    should_format_on_save = not (client.name == "null-ls")
  end

  client.resolved_capabilities.document_formatting = should_format_on_save
  client.server_capabilities.documentFormattingProvider = should_format_on_save

  local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.schedule(M.format)
      end,
      group = augroup,
      buffer = bufnr,
    })
  end
end

function M.has_formatter(filetype)
  local sources = require("null-ls.sources")
  local methods = require("null-ls").methods

  local available = sources.get_available(filetype, methods.FORMATTING)

  return #available > 0
end

return M
