-- conform prefers a formatter from the project's node_modules/.bin or venv,
-- and falls back to the Mason-installed one.
local prettier = { "prettier" }

return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_organize_imports", "ruff_format" },
    htmldjango = { "djlint" },

    vue = { "eslint_d" },
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    css = prettier,
    scss = prettier,
    html = prettier,
    json = prettier,
    yaml = prettier,
    markdown = prettier,
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  -- },
}
