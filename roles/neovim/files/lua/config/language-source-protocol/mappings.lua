local M = {}

function M.config(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  -- Displays signature help for the code element under the cursor.
  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

  -- Shows the type definition of the symbol under the cursor.
  map('<space>D', vim.lsp.buf.type_definition, 'Type Definition')

  -- Opens a floating window with diagnostic information.
  map('<space>e', vim.diagnostic.open_float, 'Floating Diagnostic')

  -- Sets the diagnostic list to display fixed diagnostics.
  map('<space>q', vim.diagnostic.setloclist, 'Fixed Diagnostic')

  -- Renames the symbol under the cursor.
  map('<space>rn', vim.lsp.buf.rename, 'Rename')

  -- Adds a workspace folder for the Language Server Protocol.
  map('<space>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add')

  -- Lists workspace folders for the Language Server Protocol.
  map('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace List')

  -- Removes a workspace folder for the Language Server Protocol.
  map('<space>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove')

  -- Displays hover documentation for the symbol under the cursor.
  map('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- Jumps to the previous diagnostic location.
  map('[d', vim.diagnostic.goto_prev, 'GoTo Prev')

  -- Jumps to the next diagnostic location.
  map(']d', vim.diagnostic.goto_next, 'GoTo Next')

  -- Retrieves the declaration of the symbol under the cursor.
  map('gD', vim.lsp.buf.declaration, 'Get Declaration')

  -- Retrieves the definition of the symbol under the cursor.
  map('gd', vim.lsp.buf.definition, 'Get Definition')

  -- Retrieves the implementation of the symbol under the cursor.
  map('gi', vim.lsp.buf.implementation, 'Get Implementation')

  -- Retrieves references to the symbol under the cursor.
  map('gr', vim.lsp.buf.references, 'Get References')
end

return M
