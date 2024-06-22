require "nvchad.mappings"
local map = vim.keymap.set
local del = vim.keymap.del
del("i", "<C-j>")
del("i", "<C-k>")
del("n", "<leader>e")
del("n", "<tab>")

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "tr", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtree toggle window" })
map("n", ";d", "<Cmd>AsyncTask file-build<cr>", { desc = "task build project" })
map("n", ";r", "<Cmd>AsyncTask file-run<cr>", { desc = "task run project" })
map("n", ";t", "<cmd>AsyncTask project-test<cr>", { desc = "task test project" })
map("n", ";p", "<cmd>AsyncTask project-run<cr>", { desc = "task build project static" })

map("n", "L", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope oldfiles" })
map("n", "<C-f>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>pj", "<cmd>Telescope projects<cr>", { desc = "Telescope search project" })
map("n", "<leader>ps", "<cmd>Telescope persisted<cr>", { desc = "Telescope search project session" })
map("n", ";nf", "<Cmd>Neogen<CR>", { desc = "commint create" })

map("n", "U", "<Cmd>UndotreeToggle<cr>", { desc = "undo tree" })
map("n", "<tab>", "za", { desc = "fold create code fold", silent = true })

local function save_session()
  vim.cmd "SessionSave"
  vim.cmd "wall"
  local project = string.match(vim.fn.getcwd(), ".-([^\\/]*)$")
  vim.notify("Save current project progress " .. project)
end
map("n", "<C-s>", save_session, { desc = "session save session" })

-- set lsp key bind
local M = {}
M.lsp_bind_keymap = function(bufnr)
  local function opt(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "<A-cr>", "<cmd>Lspsaga code_action<cr>", opt "lsp code action")
  map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt "lsp goto definition")
  map("n", "vgd", "<cmd>Lspsaga peek_definition<CR>", opt "lsp peek definition")
  map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt "lsp hover doc")
  map("n", "mr", function()
    require "nvchad.lsp.renamer"()
  end, opt "lsp rename hover doc")
  map("n", "gr", "<cmd>Lspsaga finder<cr>", opt "lsp find symbol")
  map("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt "lsp diagnostic jump prev")
  map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt "lsp diagnostic jump next")
  map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt "lsp show line diagnostic")
  map("n", "dy", "<cmd>Navbuddy<CR>", opt "lsp ranger")
end
return M
