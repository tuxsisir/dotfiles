---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "onedark",
	theme_toggle = { "onedark", "everforest" },

	hl_override = highlights.override,
	hl_add = highlights.add,
	transparency = true,

	-- cmp
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
	},
	-- nvdash (dashboard)
	nvdash = {
		load_on_startup = true,
		header = {
			"                                                   ",
			" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
			" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
			"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
			"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
			"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
			"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
			"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
			"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
			"         ░    ░  ░    ░ ░        ░   ░         ░   ",
			"                                ░                  ",
			"                                                   ",
		},
		buttons = {
			{ "  Find File", "; f f / <C-p>", "Telescope find_files" },
			{ "󰈚  Recent Files", "; f o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "; f w / <C-s>", "Telescope live_grep" },
			{ "  Bookmarks", "; m a", "Telescope marks" },
			{ "  Themes", "; t h", "Telescope themes" },
			{ "  Mappings", "; c h", "NvCheatsheet" },
		},
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
