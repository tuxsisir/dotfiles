local M = {}

M.treesitter = {
  sync_install = true,
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"vue",
		"htmldjango",
		"scss",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		"pyright",
    "isort",
		"vue-language-server",
    "eslint-lsp",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
	automatic_installation = true,
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    custom = { '^.git$', '^.DS_Store$', '^node_modules$' }
  },
	git = {
		enable = true,
    ignore = false,
	},
  renderer = {
    root_folder_label = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}


-- M.nvimcmp = {
--   sources = {
--     { name = "copilot", group_index = 2 },
--     { name = "nvim_lsp", group_index = 2 },
--     { name = "luasnip", group_index = 2 },
--     { name = "buffer", group_index = 2 },
--     { name = "nvim_lua", group_index = 2 },
--     { name = "path", group_index = 2 },
--   },
-- }

return M
