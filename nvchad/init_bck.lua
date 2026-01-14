-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.g.mapleader = ";"
-- vim.cmd 'set relativenumber'
--
-- vscode format i.e json files
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/my-snippets"

-- trim whitespaces on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

-- call linter on leaving insert
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- Automatically refresh buffer after saving the file
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*" },
--   command = "silent! e"
-- })

-- local set = vim.opt
-- local global = vim.g
-- set.foldmethod = 'indent'
--

vim.g.codeium_disable_bindings = 1
vim.g.codeium_no_map_tab = 1
-- vim.g.codeium_manual = 1
--
-- code folding
-- local vim = vim
-- local opt = vim.opt
--
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 2
vim.opt.foldenable = false  -- Disable folding by default
--
--
--
--
-- disable auto fold on TelescopeResults
-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	command = [[setlocal nofoldenable]],
})
