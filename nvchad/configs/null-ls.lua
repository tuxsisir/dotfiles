local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	-- b.formatting.prettierd.with({
	-- 	filetypes = { "html", "markdown", "css", "js", "ts" },
	-- 	extra_args = { "--config .prettierrc" },
	-- }), -- so prettier works only on these filetypes
	b.formatting.eslint_d,
	b.diagnostics.eslint_d.with({
		-- js/ts linter
		-- only enable eslint if root has .eslintrc.js
    diagnostics_format = "ESLINT: [#{c}] #{m} (#{s})",
	}),
  b.code_actions.eslint_d.with({
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
    extra_args = {
      -- "-f",
      -- "json",
      -- "--stdin",
      -- "--stdin-filename",
      -- "$FILENAME",
      '--no-eslintrc',
      '--env',
      'es6',
    },
  }),

	-- python
	b.formatting.black,
	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- json
	b.formatting.fixjson,

	-- dictionary
	b.hover.dictionary,

	-- diagnostics
}

null_ls.setup({
	debug = true,
	sources = sources,
})
