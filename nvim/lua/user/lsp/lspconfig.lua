-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- show diagnostic
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "htmldjango" }
})

-- congiure volar server
lspconfig["volar"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "vue" },
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- -- configure css server
-- lspconfig["cssls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })
--
-- -- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })
--
-- configure pyright server

local util = require("lspconfig/util")
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py", "manage.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
      or util.path.dirname(fname)
  end,
})

-- -- configure emmet language server
-- lspconfig["emmet_ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = {
--     "html",
--     "htmldjango",
--     "typescriptreact",
--     "javascriptreact",
--     "css",
--     "sass",
--     "scss",
--     "less",
--     "svelte",
--     "vue",
--   },
-- })

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

local config = {
  virtual_text = false, -- disable virtual text
  update_in_insert = false,
  underline = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.diagnostic.config(config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
--   underline = false,
-- })

-- local pubdiag = "textDocument/publishDiagnostics"
-- local def_pubdiag_handler = vim.lsp.handlers[pubdiag]
-- vim.lsp.handlers[pubdiag] = function(err, method, res, cid, bufnr, cfg)
--   def_pubdiag_handler(err, method, res, cid, bufnr, cfg)
--   vim.diagnostic.setloclist({ open = false })
-- end

-- auto show the highlights
-- local group = vim.api.nvim_create_augroup("Line Diagnostics", { clear = true })
-- vim.api.nvim_create_autocmd("CursorHold", {
--   command = "lua vim.diagnostic.open_float()",
--   group = group,
-- })


vim.cmd([[ autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic() ]])

