-- 显示lsp加载进度
local has_ts, plug = pcall(require, "fidget")
if not has_ts then return end
plug.setup{}
