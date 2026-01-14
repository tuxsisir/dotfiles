local map = vim.keymap.set

-- =============================================================================
-- NORMAL MODE (n)
-- =============================================================================
--
--
-- 1. Unmap the NvChad defaults
pcall(vim.keymap.del, "n", "<C-s>")
pcall(vim.keymap.del, "n", "<leader>h")

-- File & Buffer Management
map("n", "<leader>s", ":w<CR>", { desc = "Save buffer" })
map("n", "<leader>e", ":e<CR>", { desc = "Refresh buffer" })
map("n", "<leader>bda", ":bufdo bd<CR>", { desc = "Kill all buffers" })
map("n", "<leader>q", ":qall<CR>", { desc = "Quit all" })

-- Navigation (Tabs)
map("n", "<leader>tn", ":tabnext<CR>", { desc = "Tab Next" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Tab Previous" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-s>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- NvChad specific: Tabufline Navigation
map("n", "<C-h>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move buffer left" })

map("n", "<C-l>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move buffer right" })

-- NvChad specific: Theme/UI
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

-- Formatting (Conform.nvim)
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
  print("Buffer Formatted")
end, { desc = "Format Buffer" })

-- Git Hunk Actions
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git | Preview Hunk" })
map("n", "<leader>rh", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Git | Reset (Restore) Hunk" })
map("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git | Blame Line" })

-- Navigation between hunks
map("n", "]c", function()
  if vim.wo.diff then return "]c" end
  vim.schedule(function() require("gitsigns").next_hunk() end)
  return "<Ignore>"
end, { expr = true, desc = "Git | Next Hunk" })

map("n", "[c", function()
  if vim.wo.diff then return "[c" end
  vim.schedule(function() require("gitsigns").prev_hunk() end)
  return "<Ignore>"
end, { expr = true, desc = "Git | Prev Hunk" })

-- =============================================================================
-- INSERT MODE (i)
-- =============================================================================

map("i", "<A-BS>", "<C-W>", { desc = "Delete word on alt backspace" })

-- Codeium Accept (Uncomment if plugin is installed)
-- map("i", "<C-l>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true, silent = true, nowait = true, desc = "Codeium Accept" })
