local M = {}

function M.config(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  -- Jump to the definition of the word under your cursor.
  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

  -- Jump to the references of the word under your cursor.
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- Jump to the implementations of the word under your cursor.
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  -- Jump to the type definition of the word under your cursor.
  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

  -- Fuzzy find all the symbols in your current document
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

  -- Fuzzy find all the symbols in your current workspace
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Rename the word under your cursorline
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Opens a popup that displays all the available code actions for the word under your cursor
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Opens a popup that displays all the available code actions for the word under your cursor
  map('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- Jump to the declaration of the word under your cursor.
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

return M
