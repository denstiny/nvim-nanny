require("hlslens").setup {
  calm_down = true,
  nearest_only = true,
  nearest_float_when = "never",
}

local hlslens = require "hlslens"
if hlslens then
  local overrideLens = function(render, posList, nearest, idx, relIdx)
    local _ = relIdx
    local lnum, col = unpack(posList[idx])

    local text, chunks
    if nearest then
      text = ("[%d/%d]"):format(idx, #posList)
      chunks = { { " ", "Ignore" }, { text, "VM_Extend" } }
    else
      text = ("[%d]"):format(idx)
      chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
    end
    render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
  end
  local lensBak
  local config = require "hlslens.config"
  local gid = vim.api.nvim_create_augroup("VMlens", {})

  vim.api.nvim_create_autocmd("User", {
    pattern = { "visual_multi_start", "visual_multi_exit" },
    group = gid,
    callback = function(ev)
      if ev.match == "visual_multi_start" then
        lensBak = config.override_lens
        config.override_lens = overrideLens
      else
        config.override_lens = lensBak
      end
      hlslens.start()
    end,
  })
end

local kopts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts
)
vim.api.nvim_set_keymap(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
