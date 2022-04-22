local has_ts, nvim_notify = pcall(require, "notify")
if not has_ts then return end
nvim_notify.setup({
  -- Animation style
  stages = "fade_in_slide_out",
  -- Default timeout for notifications
  timeout = 3000,
  background_colour = "#2E3440",
})

vim.notify = nvim_notify
