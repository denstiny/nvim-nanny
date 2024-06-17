return function()
	vim.cmd([[
        "hi Normal guibg=#000000
        hi StatusLine guibg=bg
        hi EndOfBuffer guifg=bg
        "hi LineNr      guibg=bg guifg=bg
        hi link MyLineNr LineNr
        hi LineNr      guibg=bg
        hi link MyLineNr LineNr
        hi NormalFloat guibg=bg
        hi NormalNC    guibg=bg
        hi SignColumn  guibg=bg
        hi WinBar      guibg=bg
        hi WinBarNc    guibg=bg
        hi VertSplit   guibg=bg
        hi FloatBorder guibg=bg
        hi TelescopeBorder guibg=bg
        hi TelescopeNormal guibg=bg
        hi GitSignsChange guibg=bg
        hi GitSignsAdd guibg=bg
        hi GitSignsDelete guibg=bg
        hi TSPunctBracket guifg=#665c54
        hi clear CmpItemAbbr
        hi clear MatchParen
        hi MatchParen gui=bold,underline guisp=#92826A
        "==  Diagnostic begin
        hi clear DiagnosticSignError
        hi clear DiagnosticSignHint
        hi clear DiagnosticSignWarn
        hi clear DiagnosticSignInfo
        hi link DiagnosticSignError DiagnosticError
        hi link DiagnosticSignHint DiagnosticHint
        hi link DiagnosticSignWarn DiagnosticWarn
        hi link DiagnosticSignInfo DiagnosticInfo
        "==  Diagnostic end
        "hi NvimTreeRootFolder  guifg=#8094B4
        "hi NvimTreeNormalNC guibg=bg
        "hi NvimTreeNormal guibg=bg
        hi clear NvimTreeWinSeparator
        hi IndentBlanklineContextStart guisp=#2E303E gui=underline
        hi IndentBlanklineContextChar guifg=#2E303E
        hi IndentBlanklineChar guifg=#2E303E
        ]])
end
