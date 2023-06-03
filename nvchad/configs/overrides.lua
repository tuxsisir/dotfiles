local M = {}

M.treesitter = {
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
	auto_install = true,
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
	autotag = {
		enable = true,
		filetypes = { "html", "htmldjango", "xml", "vue" },
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
		"vue-language-server",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
	automatic_installation = true,
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
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

return M
