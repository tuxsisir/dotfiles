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
		["<leader>tn"] = { ":tabnext<CR>", "Tab Next" },
		["<leader>tp"] = { ":tabprevious<CR>", "Tab Previous" },
		["<C-S-h>"] = {
			function()
				-- move buffer right
				require("nvchad.tabufline").move_buf(1)
			end,
		},
		["<C-S-l>"] = {
			function()
				-- move buffer left
				require("nvchad.tabufline").move_buf(-1)
			end,
		},
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
		["<leader>fm"] = {
			function()
				require("conform").format({ async = true, lsp_fallback = true })
        print('Buffer Formatted')
			end,
			"Format Buffer",
		},
		-- mapping
	},
	i = {
		["<A-BS>"] = { "<C-W>", "Delete word on alt backspace" },
	},
}

-- more keybinds!

return M
