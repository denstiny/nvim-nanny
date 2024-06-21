local nvchad_cmp = require "nvchad.configs.cmp"
nvchad_cmp.formatting.fields = { "kind", "abbr", "menu" }
require("cmp").setup(nvchad_cmp)
