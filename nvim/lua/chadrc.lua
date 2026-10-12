---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.nvdash = {
  load_on_startup = false,
}

M.base46 = {
  theme = "palenight",
  theme_toggle = { "palenight", "everforest" },
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.ui = {

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom",
  },

  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
  },
}

return M
