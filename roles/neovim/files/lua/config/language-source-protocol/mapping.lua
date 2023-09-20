local M = {}

function M.config(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
  nmap('<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")
  nmap('<leader>D', "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition")
  nmap('<leader>F', "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format Buffer")
  nmap('<leader>rn', "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol")
  nmap('<leader>wa', "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Workspace Add Folder")
  nmap('<leader>wl', "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "Workspace List Folders")
  nmap('<leader>wr', "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Workspace Remove Folder")
  nmap('gD', "<cmd>lua vim.lsp.buf.declaration()<cr>", "GoTo Declaration")
  nmap('gd', "<cmd>lua vim.lsp.buf.definition()<cr>", "GoTo Definition")
  nmap('gi', "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation")
  nmap('gr', "<cmd>lua vim.lsp.buf.references()<cr>", "References")
  nmap('K', "<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation")
  nmap("<leader>ds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Document Symbols")
  nmap("<leader>ws", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Workspace Symbols")
end

return M
