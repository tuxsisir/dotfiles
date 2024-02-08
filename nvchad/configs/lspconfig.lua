local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local lspconfig_util = require 'lspconfig.util'

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "volar", "texlab" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.html.setup({
	filetypes = { "html", "htmldjango" },
})

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

--
-- lspconfig.pyright.setup { blabla}
