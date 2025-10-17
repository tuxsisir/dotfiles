-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
	Comment = {
		italic = true,
	},
	-- ["@comment"] = { italic = true }
}

---@type HLTable
M.add = {
	-- NvimTreeOpenedFolderName = { fg = "green", bold = true },
	-- SnacksIndent1 = { fg = "#3f4354" },
}

return M
