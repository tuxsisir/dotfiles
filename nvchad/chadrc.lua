---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "palenight",
	theme_toggle = { "palenight", "everforest" },

	hl_override = highlights.override,
	hl_add = highlights.add,
	transparency = false,

	-- cmp
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
	},
	-- nvdash (dashboard)
	nvdash = {
		load_on_startup = false,
	},
	statusline = {
		theme = "vscode_colored",
		separator_style = "block",
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
