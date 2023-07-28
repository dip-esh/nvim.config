local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--line-length", "79" } }),
		formatting.isort,
		formatting.stylua,
		diagnostics.trail_space,
		diagnostics.pycodestyle,
		-- diagnostics.mypy,
		diagnostics.flake8,
		-- diagnostics.ruff,
        -- diagnostics.pylint,
	},
})

-- it maynot work when lsp client is attached, as lsp client may not always provide the fpormatting
