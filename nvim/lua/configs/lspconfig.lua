-- NvChad defaults: on_attach keymaps, capabilities, lua_ls
require("nvchad.configs.lspconfig").defaults()

-- Every server here is installed by :MasonInstallAll (it reads this list).
local servers = {
  "html",
  "cssls",
  "eslint", -- uses the project's own eslint from node_modules
  "pyright", -- types / go-to-definition
  "ruff", -- python lint + code actions (organize imports, fixes)
  "ts_ls",
  "vue_ls", -- v3+: always "hybrid", talks to ts_ls through the vue plugin below
}

local vue_ls_path = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_ls_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})

-- ruff owns import sorting
vim.lsp.config("pyright", {
  settings = {
    pyright = { disableOrganizeImports = true },
  },
})

vim.lsp.enable(servers)
