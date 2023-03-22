vim.cmd([[
hi @constructor gui=bold
hi Normal guibg=None
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
