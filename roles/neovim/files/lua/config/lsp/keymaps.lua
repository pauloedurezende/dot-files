local M = {}

local which_key = require("which-key")

local function keymappings(client, bufnr)
  which_key.register({
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "GoTo Previous" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "GoTo Next" },
  })

  which_key.register({
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  },
    { buffer = bufnr }
  )

  which_key.register({
    ["ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    ["d"]  = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Set Location List" },
    ["D"]  = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    ["f"]  = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Formatting" },
    ["rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
    ["wl"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
    ["wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
  },
    { buffer = bufnr, prefix = "<leader>" }
  )

  which_key.register({
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
  },
    { buffer = bufnr, prefix = "g" }
  )
end

function M.config(client, bufnr)
  keymappings(client, bufnr)
end

return M
