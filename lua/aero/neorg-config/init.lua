local has_ts, neorg = pcall(require, "neorg")
if not has_ts then return end

neorg.setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.keybinds"] = {config={default_keybinds=false}},
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          my_workspace = "~/neorg"
        }
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
      }
    },
    ["core.norg.journal"] = {
      config = { -- 生成日记
      }
    },
    ["core.norg.qol.toc"] = {
      config = { -- 生成目录
        toc_split_placement='left',
        default_toc_mode = "split",
      }
    },
  },
}


