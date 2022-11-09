local _, noice = pcall(require, 'noice')
if not _ then
  return
end

noice.setup({
  lsp = {
    signature = {
      enabled = false
    }
  }
})
