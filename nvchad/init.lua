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
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
