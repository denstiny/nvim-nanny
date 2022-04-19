local null = require "null-ls"

null.setup {
	sources = {
		null.builtins.formatting.lua_format,
		null.builtins.formatting.prettier,
		null.builtins.formatting.yapf
	}
}

