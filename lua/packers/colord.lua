local _, highlight_color = pcall(require, 'nvim-highlight-colors')
if not _ then return end
highlight_color.setup {
  render = 'background', -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = false
}
