---@type MappingsTable
local M = {}

M.general = {
	n = {
		[":"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>s"] = { ":w<CR>", "Save buffer" }, -- save buffer
		-- ["<leader>e"] = { ":e<CR>", "Refresh buffer" }, -- refresh buffer
		["<leader>bda"] = { ":bufdo bd<CR>", "Kill all buffers" }, -- kill all buffers
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<C-s>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>q"] = { ":qall<CR>", "Quit all" },
		["<leader>tn"] = { ":tabnext<CR>", "Tab Next" },
		["<leader>tp"] = { ":tabprevious<CR>", "Tab Previous" },
		["<C-h>"] = {
			function()
				-- move buffer right
				require("nvchad.tabufline").move_buf(-1)
			end,
			"",
		},
		["<C-l>"] = {
			function()
				-- move buffer left
				require("nvchad.tabufline").move_buf(1)
			end,
			"",
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
				print("Buffer Formatted")
			end,
			"Format Buffer",
		},
		-- mapping
	},
	i = {
		["<A-BS>"] = { "<C-W>", "Delete word on alt backspace" },
		-- Codium
		-- ["<C-l>"] = {
		-- 	function()
		-- 		vim.fn.feedkeys(vim.fn["codeium#Accept"](), "")
		-- 	end,
		-- 	"Codium Accept",
		-- 	{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		-- },

		-- ["<C-k>"] = {
		-- 	function()
		-- 		vim.fn.feedkeys(vim.fn["codeium#CycleOrComplete"](), "")
		-- 	end,
		-- 	"Codium Next",
		-- 	{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		-- },
		-- ["<C-k>"] = {
		-- 	function()
		-- 		vim.fn.feedkeys(vim.fn['codeium#CycleCompletions'](-1), "")
		-- 	end,
		-- 	"Codium Previous",
		-- 	{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		-- },
	},
}

-- more keybinds!
-- local map = vim.keymap.set

return M
