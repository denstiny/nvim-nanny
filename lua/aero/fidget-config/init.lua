-- 显示lsp加载进度
local has_ts, fidget = pcall(require, "fidget")
if not has_ts then return end
fidget.setup{}
