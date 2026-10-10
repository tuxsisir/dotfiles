require "nvchad.autocmds"

-- nvim-treesitter (main branch) no longer has an `indent` module option;
-- treesitter indentation is opted into per buffer instead.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if pcall(vim.treesitter.get_parser, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
