local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "volar" }

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
local function getNpmGlobalModulesPath()
	local command = "npm root -g"
	local file = io.popen(command)
	local result = file:read("*a")
	file:close()

	-- Trim trailing newline character
	result = result:gsub("\n$", "")

	return result
end

local globalPkgPath = getNpmGlobalModulesPath()

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	init_options = {
		typescript = {
			tsdk = string.format("%s/typescript/lib", globalPkgPath)
		},
	},
})


-- lspconfig["volar"].setup({
-- 	filetypes = { "vue" }
-- })

--
-- lspconfig.pyright.setup { blabla}
