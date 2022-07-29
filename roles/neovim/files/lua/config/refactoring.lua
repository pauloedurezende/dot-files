local M = {}

function M.config()
  local refactoring = require("refactoring")

  local configurations = {}

  refactoring.setup(configurations)
end

return M
