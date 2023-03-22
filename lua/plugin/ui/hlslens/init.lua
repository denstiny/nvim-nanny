local hlslens = require("hlslens")
hlslens.setup({
	calm_down = true,
	nearest_only = true,
	nearest_float_when = "always",
})

vim.api.nvim_set_keymap(
	"n",
	"n",
	"<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"N",
	"<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>l", ":noh<CR>", { noremap = true, silent = true })
