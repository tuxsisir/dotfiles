-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- enable html parser in htmldjango file
local import_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
if import_parsers then
  local parsername = parsers.filetype_to_parsername
  parsername.htmldjango = "html"
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    disable = { "html", "htmldjango" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,
  },
  -- enable indentation
  indent = { enable = true, disable = { "python", "css", "html", "vue" } },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
    filetypes = { "html", "htmldjango", "xml", "vue" },
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "vue",
  },
  -- auto install above language parsers
  auto_install = true,
})
