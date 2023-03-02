local _, barbecue = pcall(require, "barbecue")
if not _ then
	return
end
barbecue.setup({
	theme = {
		normal = { bg = "#000000" },
	},
})
