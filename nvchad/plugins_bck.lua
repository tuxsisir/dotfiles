---@module 'snacks'
local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	-- {
	-- 	"kevinhwang91/nvim-ufo",
	-- 	dependencies = { "kevinhwang91/promise-async" },
	-- 	config = function()
	-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities.textDocument.foldingRange = {
	-- 			dynamicRegistration = false,
	-- 			lineFoldingOnly = true,
	-- 		}
	-- 		local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
	-- 		for _, ls in ipairs(language_servers) do
	-- 			require("lspconfig")[ls].setup({
	-- 				capabilities = capabilities,
	-- 				-- you can add other fields for setting up lsp server in this table
	-- 			})
	-- 		end
	-- 		require("ufo").setup()

	-- 		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
	-- 		-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	-- 		-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	-- 		-- require("ufo").setup({
	-- 		-- 	provider_selector = function(bufnr, filetype, buftype)
	-- 		-- 		return { "indent" }
	-- 		-- 	end,
	-- 		-- })
	-- 	end,
	-- },
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			-- pickers = {
			-- 	find_files = {
			-- 		theme = "dropdown",
			-- 	},
			-- },
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					height = 0.95,
					prompt_position = "top",
					-- horizontal = {
					--   prompt_position = "bottom",
					-- }
					-- vertical = {
					-- 	mirror = false,
					-- 	preview_cutoff = 0,
					-- },
				},
			},
		},
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{ "echasnovski/mini.nvim", version = false },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { example = "advanced" },
			explorer = { enabled = true },
			indent = {
				priority = 1,
				enabled = false, -- enable indent guides
				char = "│",
				only_scope = false, -- only show indent guides of the scope
				only_current = false, -- only show indent guides in the current window
				hl = {
					"SnacksIndent1",
					"SnacksIndent2",
					"SnacksIndent3",
				},
				animate = {
					enabled = false,
					style = "out",
					easing = "linear",
					duration = {
						step = 20, -- ms per step
						total = 200, -- maximum duration
					},
				},
			},
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			zen = { enabled = true },
		},
		keys = {
			{
				"<C-n>",
				function()
					require("snacks").explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>z",
				function()
					require("snacks").zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		lazy = false,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	-- {
	-- 	"max397574/better-escape.nvim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("better_escape").setup()
	-- 	end,
	-- },

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- {
	-- 	"github/copilot.vim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		-- vim.keymap.del("i", "<C-e>")
	-- 		-- disable tab completion for github copilot
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_assume_mapped = true
	-- 		vim.g.copilot_tab_fallback = ""
	-- 		vim.g.copilot_filetypes = {
	-- 			["*"] = true,
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	-- chatgpt
	-- 	"jackMort/ChatGPT.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	config = function()
	-- 		local home = vim.fn.expand("$HOME")
	-- 		require("chatgpt").setup({
	-- 			api_key_cmd = "cat " .. home .. "/openai.key",
	-- 		})
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("custom.configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- vue = { "eslint" }, // using eslint lsp which does the linting now
				javascript = { "eslint" },
				typescript = { "eslint" },
				javascriptreact = { "eslint" },
				typescriptreact = { "eslint" },
				svelte = { "eslint" },
				python = { "ruff" },
			}

			-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			-- 	group = lint_augroup,
			-- 	callback = function()
			-- 		lint.try_lint()
			-- 	end,
			-- })

			vim.keymap.set("n", "<leader>lt", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
	{
		"max397574/better-escape.nvim",
		enabled = false,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		init = function()
			vim.g.toggle_cmp = true
			vim.keymap.set("n", "<leader>oa", function()
				vim.g.toggle_cmp = not vim.g.toggle_cmp
				if vim.g.toggle_cmp then
					vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
				else
					vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
				end
			end, { desc = "Options | Toggle Autocomplete" })
		end,
		config = function(_, opts)
			-- table.insert(opts.sources, 2, { name = "codeium" })
			table.insert(opts.sources, 1, { name = "supermaven" })

			opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
				-- You can add here new mappings.
			})

			opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

			opts.enabled = function()
				return (vim.g.toggle_cmp and vim.bo.buftype == "")
			end

			require("luasnip").filetype_extend("javascriptreact", { "html" })
			require("luasnip").filetype_extend("typescriptreact", { "html" })
			require("luasnip").filetype_extend("svelte", { "html" })
			require("luasnip").filetype_extend("vue", { "html" })
			require("luasnip").filetype_extend("php", { "html" })
			require("luasnip").filetype_extend("javascript", { "javascriptreact" })
			require("luasnip").filetype_extend("typescript", { "typescriptreact" })

			--NOTE: add border for cmp window
			if vim.g.border_enabled then
				opts.window = {
					completion = require("cmp").config.window.bordered(),
					documentation = require("cmp").config.window.bordered(),
				}
			end

			require("cmp").setup(opts)

			local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
				-- ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
			})

			require("cmp").setup.cmdline(":", {
				mapping = cmdline_mappings,
				sources = {
					{ name = "cmdline" },
				},
			})
		end,
		dependencies = {
			-- For Rust
			-- {
			-- 	"saecki/crates.nvim",
			-- 	tag = "v0.4.0",
			-- 	opts = {},
			-- },
			-- Commandline completions
			{
				"hrsh7th/cmp-cmdline",
			},
			-- AI Autocomplete
			-- {
			-- 	"Exafunction/codeium.nvim",
			-- 	enabled = true,
			--   dependencies = "nvim-lua/plenary.nvim"
			--   -- opts = {
			-- 	-- 	enable_chat = true,
			-- 	-- },
			-- },
			{
				"supermaven-inc/supermaven-nvim",
				-- commit = "df3ecf7",
				event = "BufReadPost",
				opts = {
					disable_keymaps = false,
					disable_inline_completion = false,
					keymaps = {
						accept_suggestion = "<C-f>",
						clear_suggestion = "<Nop>",
						accept_word = "<C-y>",
					},
				},
			},
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				build = "make install_jsregexp",
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		enabled = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},
	-- {
	--   "Exafunction/codeium.nvim",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "hrsh7th/nvim-cmp",
	--   }
	-- },
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	event = "BufEnter",
	-- },
}

-- To make a plugin not be loaded
-- {
--   "NvChad/nvim-colorizer.lua",
--   enabled = true
-- },
-- All NvChad plugins are lazy-loaded by default
-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
-- {
--   "mg979/vim-visual-multi",
--   lazy = false,
-- }

return plugins
