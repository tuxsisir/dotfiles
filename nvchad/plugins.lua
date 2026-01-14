-- ~/dotfiles/nvchad/plugins.lua

local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- 1. LSP & MASON (The modern way)
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Use the new NvChad 2.5 internal paths
			require("nvchad.configs.lspconfig").defaults()
			require("custom.configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("custom.configs.overrides").mason
		end,
	},

	-- 2. TELESCOPE OVERRIDE (NvChad already has the plugin, just change opts)
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					height = 0.95,
					prompt_position = "top",
				},
			},
		},
	},

	-- 3. SNACKS.NVIM (Your Modern Utility Belt)
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true, example = "advanced" },
			explorer = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			scroll = { enabled = true },
			words = { enabled = true },
			zen = { enabled = true },
		},
		keys = {
			{
				"<C-n>",
				function()
					require("snacks").explorer()
				end,
				desc = "Explorer",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>z",
				function()
					require("snacks").zen()
				end,
				desc = "Zen Mode",
			},
		},
	},

	-- 4. FORMATTING & LINTING
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
    lazy = false,
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
        lua = { "luacheck" },
				javascript = { "eslint" },
				typescript = { "eslint" },
				python = { "ruff" },
			}
		end,
	},

	-- 5. AUTOCOMPLETE (CMP) & AI
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

	-- 6. TREESITTER & OTHER UTILS
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{ "windwp/nvim-ts-autotag", lazy = false, opts = {} },

	{ "folke/trouble.nvim", cmd = "Trouble", opts = {} },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle" },
		ft = { "markdown" },
		build = "cd app && yarn install",
	},
}

return plugins
