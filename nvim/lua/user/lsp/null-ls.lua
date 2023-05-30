-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    --  to disable file types use
    --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
    formatting.black,
    formatting.prettier, -- js/ts formatter
    formatting.stylua, -- lua formatter
    formatting.djhtml.with({
      args = { "-t 2" },
    }),
    formatting.eslint_d,
    diagnostics.eslint_d.with({
      -- js/ts linter
      -- only enable eslint if root has .eslintrc.js
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js", ".eslintrc", ".eslintrc.cjs") -- change file extension if you use something else
      end,
    }),
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<C-i>", ":lua vim.lsp.buf.format { async = true }<CR>")
    end
    -- RANGE FORMATTING
    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<leader>ff", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
