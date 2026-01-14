-- Initialize NvChad's native LSP defaults (handles UI, keybinds, etc)
-- require("nvchad.configs.lspconfig").defaults()

-- 1. Simple Servers
-- Note: 'ts_ls' is the new name for tsserver
local servers = { "html", "cssls", "tailwindcss", "eslint" }
vim.lsp.enable(servers)

-- 2. VUE_LS Configuration (Formerly Volar)
vim.lsp.config("vue_ls", {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  filetypes = { "vue" },
})
vim.lsp.enable("vue_ls")

-- 3. TS_LS Configuration
-- We enable the Vue plugin here so TypeScript understands .vue files
vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        -- Correct path for Mason installs
        location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "javascript", "typescript", "vue" },
})
vim.lsp.enable("ts_ls")
