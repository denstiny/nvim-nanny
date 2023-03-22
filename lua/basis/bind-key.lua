local U = require("core.bind-tool")
vim.g.mapleader = ";"

U.nmap("tr", "<Cmd>NvimTreeFindFileToggle<cr>")

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-\\>", "<Cmd>ToggleTerm<cr>", opts)
end

U.nmap("<C-\\>", "<Cmd>ToggleTerm<cr>")
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- colpy text
U.nmap(";y", '"+y')
U.vmap(";y", '"+y')

-- exit nvim
U.nmap("<Leader>q", "<Cmd>qall<cr>")
U.nmap("<A-q>", "<Cmd>wqall!<cr>")

-- 扩展窗口大小
U.nmap("<C-l>", "<Cmd>vertical res +5<cr>")
U.nmap("<C-h>", "<Cmd>vertical res -5<cr>")
U.nmap("<C-j>", "<Cmd>res +5<cr>")
U.nmap("<C-k>", "<Cmd>res -5<cr>")

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
U.nmap("<Leader>t", "<cmd>AsyncTask file-test<cr>")

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
U.nmap("<Leader>nf", "<Cmd>lua require('neogen').generate()<CR>")

-- telescope help_tags
U.nmap("<a-H>", "<Cmd>Telescope help_tags<cr>")

-- Alpha
U.nmap("H", '<cmd>lua require("plugin.ui.alpha")<cr><cmd>Alpha<cr>')
