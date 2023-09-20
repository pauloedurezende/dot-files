local M = {}

function M.format()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[buf].filetype
  local should_format_with_null_ls = #require("null-ls.sources").get_available(filetype, "NULL_LS_FORMATTING") > 0

  local view = vim.fn.winsaveview()

  vim.lsp.buf.format {
    async = true,
    filter = function(client)
      if should_format_with_null_ls then
        return client.name == "null-ls"
      end

      return client.name ~= "null-ls"
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

  if not should_format_on_save then
    return
  end

  client.server_capabilities.documentFormattingProvder = should_format_on_save
  client.server_capabilities.documentRangeFormattingProvider = should_format_on_save

  if client.server_capabilities.documentFormattingProvider then
    local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })

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
