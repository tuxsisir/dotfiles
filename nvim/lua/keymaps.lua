-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

--Remap ; as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Custom save
keymap("n", "<leader>s", ":w<CR>", opts)

-- Delete all buffers
keymap("n", "<leader>bda", ":bufdo bd<CR>", opts)

-- Better paste
-- keymap("v", "p", '"_dP', opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Delete word on alt backspace
keymap("i", "<A-BS>", "<C-W>", opts)

-- Delete buffer
keymap("n", "<leader>x", ":bd<CR>", opts)

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-s>", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>pp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
