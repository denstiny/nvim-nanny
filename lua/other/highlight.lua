vim.cmd([[
" 3024"
"hi Normal guibg=#090300
"hi EndOfBuffer guifg=bg
"hi LineNr      guibg=bg
"hi NormalFloat guibg=bg
"hi NormalNC    guibg=bg
"hi SignColumn  guibg=bg
"hi WinBar      guibg=bg
"hi WinBarNc    guibg=bg
"hi VertSplit   guibg=bg
hi @constructor gui=bold
"hi FloatBorder guifg=#5B72AE
hi TelescopeBorder guifg=#5B72AE
hi IndentBlanklineContextStart guisp=#EA6962 gui=underline
hi IndentBlanklineContextChar guifg=#EA6962
hi DiagnosticSignHint  gui=underline cterm=underline guisp=#7982B4
hi DiagnosticSignInfo  gui=underline cterm=underline guisp=#82aaff
hi DiagnosticSignError gui=undercurl cterm=undercurl guisp=#ff5370
hi DiagnosticSignWarn  gui=undercurl cterm=undercurl guisp=#f78c6c
hi LspSagaLightBulb    gui=bold
]])
--local bg = string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true)["background"])
--local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
--vim.g.Mycolor = require("core.tool").get_color("Normal", "bg#")
