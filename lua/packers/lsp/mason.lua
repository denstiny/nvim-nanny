--- { mason

local _, mason = pcall(require, 'mason')
if not _ then return end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  pip = {
    install_args = { "--proxy", "127.0.0.1:7890" },
  }
})

---}
