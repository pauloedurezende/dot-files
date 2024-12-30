local M = {}

local function map_keys(bufnr)
  local function map(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
  map('<space>ca', vim.lsp.buf.code_action, 'Code Action')
  map('<space>D', vim.lsp.buf.type_definition, 'Type Definition')
  map('<space>e', vim.diagnostic.open_float, 'Floating Diagnostic')
  map('<space>q', vim.diagnostic.setloclist, 'Fixed Diagnostic')
  map('<space>rn', vim.lsp.buf.rename, 'Rename')
  map('<space>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add')
  map('<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List')
  map('<space>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('[d', vim.diagnostic.goto_prev, 'GoTo Prev')
  map(']d', vim.diagnostic.goto_next, 'GoTo Next')
  map('gD', vim.lsp.buf.declaration, 'Get Declaration')
  map('gd', vim.lsp.buf.definition, 'Get Definition')
  map('gi', vim.lsp.buf.implementation, 'Get Implementation')
  map('gr', vim.lsp.buf.references, 'Get References')
end

function M.config(_, bufnr)
  map_keys(bufnr)
end

return M
