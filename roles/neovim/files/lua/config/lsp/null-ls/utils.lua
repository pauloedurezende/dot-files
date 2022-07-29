local M = {}

function M.list_registered_providers_names(filetype)
  local sources = require("null-ls.sources")
  local available_sources = sources.get_available(filetype)
  local registered = {}

  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end

  return registered
end

return M
