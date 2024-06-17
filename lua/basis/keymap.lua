local U = require("core.bind-tool")
vim.g.mapleader = ";"
U.nmap("tr", function()
	local tree = require("nvim-tree.api").tree
	tree.toggle({ path = "<args>", find_file = false, update_root = true, focus = true })
end)

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<A-esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-\\>", "<Cmd>ToggleTerm<cr>", opts)
end

U.nmap("<C-\\>", "<Cmd>ToggleTerm<cr>")
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

U.nmap("H", "<Cmd>Alpha<cr>")

-- colpy text
U.nmap(";y", '"+y')
U.vmap(";y", '"+y')

-- exit nvim
U.nmap("<Leader>q", "<Cmd>qall<cr>")
U.nmap("<A-q>", "<Cmd>wqall!<cr>")

-- 调整窗口大小
U.nmap("<C-l>", "<Cmd>vertical res +5<cr>")
U.nmap("<C-h>", "<Cmd>vertical res -5<cr>")
U.nmap("<C-j>", "<Cmd>res +5<cr>")
U.nmap("<C-k>", "<Cmd>res -5<cr>")
--U.nmap("<C-l>", '<Cmd>lua require("colorful-winsep.expand").ExpandSize("l")<cr>')
--U.nmap("<C-h>", '<Cmd>lua require("colorful-winsep.expand").ExpandSize("h")<cr>')
--U.nmap("<C-j>", '<Cmd>lua require("colorful-winsep.expand").ExpandSize("j")<cr>')
--U.nmap("<C-k>", '<Cmd>lua require("colorful-winsep.expand").ExpandSize("k")<cr>')
-- symbols map
U.nmap("ts", "<Cmd>Lspsaga outline<cr>")

-- Dap Config
U.nmap("<F5>", "<Cmd>DapContinue<cr>") -- 启动调试
U.nmap("<F4>", "<Cmd>DapRestart<cr>") -- 启动调试
U.nmap("<F7>", "<Cmd>DapClose<cr>") -- 关闭调试
U.nmap("<F9>", "<Cmd>DapToggleBreakpoint<cr>") -- 设置断点
U.nmap("<F10>", "<Cmd>DapStepOver<cr>") -- 步入
U.nmap("<F11>", "<Cmd>DapStepInto<cr>") -- 单步调试
U.nmap("<F2>", "<Cmd>DapToggleRepl<cr>")

-- undo tree
U.nmap("L", "<Cmd>UndotreeToggle<cr>")

--  Async Task
U.nmap("<Leader>r", "<Cmd>AsyncTask file-run<cr>")
U.nmap("<Leader>d", "<Cmd>AsyncTask file-build<cr>")
U.nmap("<Leader>t", "<cmd>AsyncTask project-test<cr>")
U.nmap("<Leader>p", "<cmd>AsyncTask project-run<cr>")

U.nmap("gf", "<Cmd>e <cfile><Cr>")

-- telescope
U.nmap("F", "<Cmd>Telescope current_buffer_fuzzy_find<cr>")
U.nmap("?", "<Cmd>Telescope grep_string<cr>")
U.nmap("B", "<Cmd>Telescope buffers<cr>")
U.nmap("<C-f>", "<Cmd>Telescope find_files<cr>")

-- luasnip
U.map("i", "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
U.map("i", "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
U.map("s", "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
U.map("s", "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')

-- 注释
U.nmap("<Leader>nf", "<Cmd>Neogen<CR>")

-- telescope help_tags
U.nmap("<a-H>", "<Cmd>Telescope help_tags<cr>")

-- swith c/c++ source file and header file
U.nmap("<C-e>", "<cmd>Ouroboros<cr>")
U.nmap("s<C-e>", "<cmd>vsplit | Ouroboros<cr>")
U.nmap("v<C-e>", "<cmd>split | Ouroboros<cr>")

--- create c++ fun define
U.nmap("cr", "<cmd>ImplementInSource<cr>")
U.vmap("cr", '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>')

-- Git Link
U.vmap("<leader>gy", '<cmd>lua require"gitlinker".get_buf_range_url("v", {})<cr>')
U.nmap("<leader>gy", '<cmd>lua require"gitlinker".get_buf_range_url("n", {})<cr>')

U.nmap("<Tab>", "za")
U.nmap("da", "<Cmd>Telescope diagnostics<cr>")
--U.nmap("<C-s>", "<Cmd>SessionSave<cr><Cmd>wall<cr><Cmd>echo 'Save '<cr>")
local function save_session()
	vim.cmd("SessionSave")
	vim.cmd("wall")
	local project = string.match(vim.fn.getcwd(), ".-([^\\/]*)$")
	vim.notify("Save current project progress " .. project)
end
U.nmap("<C-s>", save_session)

U.nmap("<Leader>git", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		float_opts = {
			height = 100,
		},
		on_open = function(arg)
			vim.cmd("startinsert!")
			--vim.api.nvim_buf_del_keymap(arg.buf, "i", "<esc>")
		end,
	})
	lazygit:toggle()
end)

U.nmap("]]", "zj")
U.nmap("[[", "zk")
-- Session
U.nmap("S", "<Cmd>Session<cr>")

local M = {}
function M.lsp_keymaps(bufnr)
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "vgd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "mr", "<cmd>Lspsaga rename<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Lspsaga finder<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<A-cr>", "<cmd>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "dy", "<cmd>Navbuddy<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gw", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
end

return M
