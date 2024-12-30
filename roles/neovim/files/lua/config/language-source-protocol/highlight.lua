local M = {}

local function setup_autocmds(bufnr)
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

function M.config(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    setup_autocmds(bufnr)
  end
end

return M
