---@type MappingsTable
local M = {}

M.general = {
	n = {
		[":"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>s"] = { ":w<CR>", "Save buffer" }, -- save buffer
		["<leader>bda"] = { ":bufdo bd<CR>", "Kill all buffers" }, -- kill all buffers
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<C-s>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>q"] = { ":qall<CR>", "Quit all" },
		["<C-l>"] = { ":bnext<CR>", "Navigate buffer next" },
		["<C-h>"] = { ":bprevious<CR>", "Navigate buffer previous" },
    ["<leader>tn"] = { ":tabnext<CR>", "Tab Next" },
    ["<leader>tp"] = { ":tabprevious<CR>", "Tab Previous" },
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = false })
			end,
			"LSP formatting",
		},
		-- mapping
	},
	i = {
		["<A-BS>"] = { "<C-W>", "Delete word on alt backspace" },
	},
}

-- more keybinds!

return M
