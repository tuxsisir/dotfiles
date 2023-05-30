---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "vscode_dark",
  theme_toggle = { "vscode_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = false,
  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File", "<C-p>", "Telescope find_files" },
      { "󰈚  Recent Files", "<leader> f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "<C-s>", "Telescope live_grep" },
      { "  Bookmarks", "<leader> m a", "Telescope marks" },
      { "  Themes", "<leader> t h", "Telescope themes" },
      { "  Mappings", "<leader> c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
