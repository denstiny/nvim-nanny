local _, hologram = pcall(require,"hologram")
if not _ then return end
hologram.setup {
  auto_display = false -- WIP automatic markdown image display, may be prone to breaking
}
