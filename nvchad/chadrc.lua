---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

-- NEW: nvdash is now a TOP-LEVEL key
M.nvdash = {
  load_on_startup = false,
  -- You can add buttons/header here if you want
}

M.base46 = {
  theme = "palenight",
  theme_toggle = { "palenight", "everforest" },
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- M.ui is now strictly for the core UI looks
M.ui = {

  -- cmp settings (nested under ui is still fine for these)
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
