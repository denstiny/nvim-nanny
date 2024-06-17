local plugin = require("core.packers")

plugin.add({
	"Verf/deepwhite.nvim",
	config = function()
		require("plugin.themes.deepwhite")
	end,
	priority = 1000,
	cond = true,
})

plugin.add({
	"mcchrish/zenbones.nvim",
	dependencies = {
		"rktjmp/lush.nvim",
	},
	config = function()
		require("plugin.themes.zenbones")
	end,
	priority = 1000,
	cond = false,
})
