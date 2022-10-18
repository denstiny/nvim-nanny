local U = require("core.bind-tool")
vim.g.mapleader = ';'
-- leader-e: 定义快速位移
U.nmap("<Leader>eb", "<Plug>(easymotion-b)")
U.nmap("<Leader>ee", "<Plug>(easymotion-e)")
U.nmap("<Leader>ef", "<Plug>(easymotion-f)")
U.nmap("<Leader>ej", "<Plug>(easymotion-j)")
U.nmap("<Leader>ek", "<Plug>(easymotion-k)")
U.nmap("<Leader>en", "<Plug>(easymotion-n)")
U.nmap("<Leader>es", "<Plug>(easymotion-s)")
U.nmap("<Leader>et", "<Plug>(easymotion-t)")
U.nmap("<Leader>ew", "<Plug>(easymotion-w)")

-- leader-t: 翻译
U.nmap("<leader>te", "<Plug>Translate")
U.vmap("<leader>te", "<Plug>TranslateV")
U.nmap("<leader>tw", "<Plug>TranslateW")
U.vmap("<leader>tw", "<Plug>TranslateWV")
U.nmap("<leader>tr", "<Plug>TranslateR")
U.vmap("<Leader>tr", "<Plug>TranslateRV")
U.nmap("<Leader>tx", "<Plug>TranslateX")
--U.nmap("<leader>te", "<cmd>Pantran mode=hover target=zh<cr>")
--U.vmap("<leader>te", ":Pantran mode=hover target=zh<cr>")
--U.nmap("<leader>tr", ":Pantran mode=replace target=zh<cr>")
--U.vmap("<leader>tr", ":Pantran mode=replace target=zh<cr>")
--U.nmap("<leader>tw", ":Pantran  target=zh<cr>")
--U.vmap("<leader>tw", ":Pantran  target=zh<cr>")

--- nvim tree
U.nmap("tr", "<Cmd>NvimTreeFindFileToggle<cr>")
-- term
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-\\>', "<Cmd>ToggleTermTree<cr>", opts)
end

U.nmap('<C-\\>', "<Cmd>ToggleTermTree<cr>")


vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
-- colpy text
U.nmap(";y", '"+y')
U.vmap(";y", '"+y')
-- exit nvim
U.nmap("<Leader>q", "<Cmd>qall<cr>")
U.nmap("<A-q>", "<Cmd>wqall!<cr>")
--U.nmap("q","<Cmd>q<cr>")

-- Paste from clipboard
U.nmap("<C-p>", [["+p]])
U.vmap("<C-p>", [["+p]])


-- 扩展窗口大小
U.nmap("<C-l>", "<Cmd>vertical res +5<cr>")
U.nmap("<C-h>", "<Cmd>vertical res -5<cr>")
U.nmap("<C-j>", "<Cmd>res +5<cr>")
U.nmap("<C-k>", "<Cmd>res -5<cr>")

-- fold
U.nmap("<tab>", "<Cmd>normal za<cr>")


--U.nmap("<Leader>ad", "<Cmd>lua addStartify_bookmark()<cr>")
--- lsp tree
U.nmap("ts", "<Cmd>SymbolsOutline<cr>")

-- Dap Config
U.nmap("<F5>", "<Cmd>DapContinue<cr>") -- 启动调试
U.nmap("<F4>", "<Cmd>DapRestart<cr>") -- 启动调试
U.nmap("<F7>", "<Cmd>DapClose<cr>") -- 关闭调试
U.nmap("<F9>", "<Cmd>DapToggleBreakpoint<cr>") -- 设置断点
U.nmap("<F10>", "<Cmd>DapStepOver<cr>") -- 步入
U.nmap("<F11>", "<Cmd>DapStepInto<cr>") -- 单步调试
U.nmap("<F2>", "<Cmd>DapToggleRepl<cr>")

--exchange buffer
U.nmap("<a-p>", "<Cmd>BufferLineCyclePrev<cr>")
U.nmap("<a-n>", "<Cmd>BufferLineCycleNext<cr>")
U.nmap("b", "<Cmd>BufferLinePick<cr>")
U.nmap("cb", "<Cmd>BufferLinePickClose<cr>")
--U.nmap("q","<Cmd>q<cr>")

-- No interference pattern
U.nmap("<Leader>z", "<Cmd>lua Truezen()<cr>")

-- undo tree
U.nmap("L", "<Cmd>UndotreeToggle<cr>")
--  Async Task
U.nmap("<Leader>r", "<Cmd>AsyncTask file-run<cr>")
U.nmap("<Leader>d", "<Cmd>AsyncTask file-build<cr>")

--- goto preview
U.nmap("gpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>")
U.nmap("gf", "<Cmd>e <cfile><Cr>")

-- telescope
U.nmap("F", "<Cmd>Telescope current_buffer_fuzzy_find<cr>")
U.nmap("?", "<Cmd>Telescope grep_string<cr>")
U.nmap("B", "<Cmd>Telescope buffers<cr>")
U.nmap("<C-f>", "<Cmd>Telescope find_files<cr>")

-- luasnip
U.map('i', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
U.map('i', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
U.map('s', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
U.map('s', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')




-- siderbar
--U.nmap("td", "<Cmd>lua require('sidebar-nvim').toggle()<CR>")
-- fold lsp
U.nmap("tp", "<Cmd>lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})<CR>")
-- 注释
U.nmap("<Leader>nf", "<Cmd>lua require('neogen').generate()<CR>")

-- startify
U.nmap("H", "<Cmd>Startify<cr>")
-- colip list
U.nmap("<C-p>", "<Cmd>Telescope neoclip a<cr>")
U.nmap("<A-t>", "<Cmd>echo &filetype<cr>")
-- Open project
U.nmap("<A-p>", "<Cmd>Telescope projects theme=dropdown<cr>")
U.nmap("<A-p>", "<Cmd>Telescope projects theme=dropdown<cr>")
-- fcitx
U.imap("<C-Space>", "<Cmd>lua require'fcitx5-ui'.toggle()<cr>")
U.nmap("<C-Space>", "<Cmd>lua require'fcitx5-ui'.toggle()<cr>")
-- hlslens