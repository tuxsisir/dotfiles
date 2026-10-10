require "nvchad.mappings"

local map = vim.keymap.set

-- NvChad defaults I don't want
pcall(vim.keymap.del, "n", "<leader>h")

-- =============================================================================
-- NORMAL MODE
-- =============================================================================

-- `;` is also the leader, so a bare `;` waits for timeoutlen before entering cmdline
map("n", ";", ":", { desc = "CMD enter command mode" })

-- File & Buffer Management
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Save buffer" })
map("n", "<leader>e", "<cmd>e<CR>", { desc = "Refresh buffer" })
map("n", "<leader>bda", "<cmd>bufdo bd<CR>", { desc = "Kill all buffers" })
map("n", "<leader>q", "<cmd>qall<CR>", { desc = "Quit all" })

-- Tabs
map("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Tab Next" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Tab Previous" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-s>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- File explorer (replaces NvChad's NvimTree toggle)
map("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Snacks Explorer" })

-- Tabufline: reorder buffers (replaces NvChad's window left/right)
map("n", "<C-h>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move buffer left" })

map("n", "<C-l>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move buffer right" })

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

map("n", "<leader>fm", function()
  require("conform").format { async = true }
end, { desc = "Format Buffer" })

-- Git hunks
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git | Preview Hunk" })
map("n", "<leader>rh", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Git | Reset (Restore) Hunk" })
map("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git | Blame Line" })

map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").nav_hunk "next"
  end)
  return "<Ignore>"
end, { expr = true, desc = "Git | Next Hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").nav_hunk "prev"
  end)
  return "<Ignore>"
end, { expr = true, desc = "Git | Prev Hunk" })

-- =============================================================================
-- INSERT MODE
-- =============================================================================

map("i", "jk", "<ESC>")
map("i", "<A-BS>", "<C-W>", { desc = "Delete word on alt backspace" })
