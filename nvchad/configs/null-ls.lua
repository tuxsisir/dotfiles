local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettierd.with({
    filetypes = { "html", "markdown", "css", "vue" },
    extra_args = { "--single-quote" }
  }), -- so prettier works only on these filetypes

  -- python
  b.formatting.black,
	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
