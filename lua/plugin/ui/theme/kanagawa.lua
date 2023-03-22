require("kanagawa").setup({
	overrides = function(colors)
		return {
			Normal = { bg = "none" },
			StatusLine = { bg = "none" },
			EndOfBuffer = { fg = "none" },
			LineNr = { bg = "none" },
			NormalFloat = { bg = "none" },
			NormalNC = { bg = "none" },
			SignColumn = { bg = "none" },
			WinBar = { bg = "none" },
			WinBarNc = { bg = "none" },
			VertSplit = { bg = "none" },
			FloatBorder = { bg = "none" },
			TelescopeBorder = { bg = "none" },
		}
	end,
})
