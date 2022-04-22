local has_ts, plug = pcall(require, "scrollbar")
if not has_ts then return end
plug.setup({
    handle = {
        color = "#221F34",
    },
    --marks = {
    --    Search = { color = "#403d52" },
    --    Error = { color = "#eb6f92" },
    --    Warn = { color = "#f6c177" },
    --    Info = { color = "" },
    --    Hint = { color = colors.hint },
    --    Misc = { color = colors.purple },
    --}
})
