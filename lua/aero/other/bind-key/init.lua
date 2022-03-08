local U = require("aero.other.bind-key.tool")
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


-- colpy text
U.vmap(";y", '"+y')
-- exit nvim
U.nmap("<leader>q","<Cmd>qall<cr>")
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
U.nmap("<tab>","<Cmd>normal za<cr>")


--- nvim tree
U.nmap("tr","<Cmd>NvimTreeToggle<cr>")
U.nmap("<leader>ad", "<Cmd>lua addStartify_bookmark()<cr>")
--- lsp tree
U.nmap("ts", "<Cmd>SymbolsOutline<cr>")

-- nvim tree
U.nmap("tr","<Cmd>NvimTreeToggle<cr>")

-- vimsector config
U.nmap("<leader>vs","<Cmd>tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>")
U.nmap("<F7>", "<Cmd>VimspectorReset<cr>")            -- 停止调试(quit debug)
U.nmap("<F4>", "<Plug>VimspectorRestart")             -- 使用相同配置重新调试( restart debug)
U.nmap("<F2>", "<Plug>VimspectorBalloonEval")


--exchange buffer
U.nmap("<a-p>","<Cmd>BufferLineCyclePrev<cr>")
U.nmap("<a-n>","<Cmd>BufferLineCycleNext<cr>")
U.nmap("b","<Cmd>BufferLinePick<cr>")
U.nmap("cb","<Cmd>BufferLinePickClose<cr>")
--U.nmap("q","<Cmd>q<cr>")

-- No interference pattern
U.nmap("<leader>z","<Cmd>lua Truezen()<cr>")

-- undo tree
U.nmap("L", "<Cmd>UndotreeToggle<cr>")
--  Async Task
U.nmap("<leader>r","<Cmd>AsyncTask file-run<cr>")
U.nmap("<leader>d", "<Cmd>AsyncTask file-build<cr>")
-- error list
U.nmap("er", "<Cmd>Trouble<cr>")

--- goto preview
U.nmap("gpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>")
U.nmap("gf", "<Cmd>e <cfile><Cr>")

-- telescope
U.nmap("F", "<Cmd>Telescope current_buffer_fuzzy_find<cr>")
U.nmap("?", "<Cmd>Telescope grep_string<cr>")
U.nmap("B","<Cmd>Telescope buffers<cr>")
U.nmap("<C-f>", "<Cmd>Telescope find_files<cr>")

-- luasnip
U.map('i', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
U.map('i', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
U.map('s', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
U.map('s', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')


-- term
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- siderbar
U.nmap("td", "<Cmd>lua require('sidebar-nvim').toggle()<CR>")
-- fold lsp
U.nmap("tp","<Cmd>lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})<CR>")
-- 注释
U.nmap("<leader>nf", "<Cmd>lua require('neogen').generate()<CR>")

-- startify
U.nmap("H", "<Cmd>Startify<cr>")
-- colip list
U.nmap("<C-p>", "<Cmd>Telescope neoclip a<cr>")
U.nmap("<A-t>","<Cmd>echo &filetype<cr>")
