local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
-- local lspconfig_util = require 'lspconfig.util'

-- if you just want default config for the servers then put them in a table here
local servers = { "tailwindcss", "texlab", "eslint", "ts_ls", "pyright" }

local function disable_formatting(client)
client.server_capabilities.documentFormattingProvider = false
client.server_capabilities.documentRangeFormattingProvider = false
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- lspconfig.html.setup({
-- 	filetypes = { "html", "htmldjango" },
-- })
--
--

-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- })


-- volar
-- don't allow volar to do the formatting, eslint-lsp will handle the formatting (falling back from conform formatting to lsp)
lspconfig.volar.setup({
	on_attach = function(client)
    disable_formatting(client)
	end,
	capabilities = capabilities,
	filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	init_options = {
		vue = {
			hybridMode = false,
		},
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
		},
	},
})

-- tsserver
-- lspconfig.tsserver.setup({
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
--         languages = {"javascript", "typescript", "vue"},
--       },
--     },
--   },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "vue",
--   },
-- })

-- congiure volar server
-- local function getNpmGlobalModulesPath()
-- 	local command = "npm root -g"
-- 	local file = io.popen(command)
-- 	local result = file:read("*a")
-- 	file:close()
--
-- 	-- Trim trailing newline character
-- 	result = result:gsub("\n$", "")
--
-- 	return result
-- end
--
-- local globalPkgPath = getNpmGlobalModulesPath()
--
-- lspconfig.volar.setup({
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
-- 	init_options = {
-- 		typescript = {
-- 			tsdk = string.format("%s/typescript/lib", globalPkgPath),
-- 		},
-- 		languageFeatures = {
-- 			implementation = true, -- new in @volar/vue-language-server v0.33
-- 			documentHighlight = true,
-- 			documentLink = true,
-- 			codeLens = { showReferencesNotification = true },
-- 			-- not supported - https://github.com/neovim/neovim/pull/15723
-- 			semanticTokens = false,
-- 			diagnostics = true,
-- 			schemaRequestService = true,
-- 		},
-- 	},
-- })

-- lspconfig["volar"].setup({
-- 	filetypes = { "vue" }
-- })

