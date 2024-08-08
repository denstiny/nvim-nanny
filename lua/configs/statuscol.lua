local builtin = require "statuscol.builtin"
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- --vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
local cfg = {
  setopt = true,
  relculright = false,
  ft_ignore = { "neo-tree", "NvimTree", "alpha", "undotree", "diff", "toggleterm", "sagaoutlin" },
  segments = {
    { text = { "%s", "" }, click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    {
      text = { "", builtin.foldfunc, " " }, -- also impact by the default setting for fillchars && foldcolumn
      condition = { builtin.not_empty, true, builtin.not_empty },
      click = "v:lua.ScFa",
    },
  },
}
require("statuscol").setup(cfg)
