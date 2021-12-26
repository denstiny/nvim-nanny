require("zen-mode").setup {
    window = {
        width = .75 -- width will be 85% of the editor width
    }
    ,
    on_open = function(win)
        vim.o.number = false
    end,
    on_close = function()
        vim.o.number = true
    end,
}
