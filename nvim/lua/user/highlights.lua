vim.cmd([[highlight IndentBlanklineChar guifg=#474747 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#828282 gui=nocombine]])
-- vim.cmd([[ let &t_8f="\<Esc>[38;2;%lu;%lu;%lum" ]])
-- vim.cmd([[ let &t_8b="\<Esc>[48;2;%lu;%lu;%lum" ]])
-- vim.api.nvim_set_hl(0, "@htmlArg", { italic = true })
-- vim.cmd([[ highlight htmlArg cterm=italic ]])
vim.api.nvim_set_hl(0, "@comment", { fg = "#44445b", italic = true })
vim.api.nvim_set_hl(0, "htmlArg", { italic = true })
