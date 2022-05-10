local has_ts, neorg = pcall(require, "neorg")
if not has_ts then return end

neorg.setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {
      config = {
        icons = {
          heading = {
            level_1 = { enabled = true, icon = "◉", },
            level_2 = { enabled = true, icon = ' ◎' },
            level_3 = { enabled = true, icon = '  ○' },
            level_4 = { enabled = true, icon = '   ✺' },
            level_5 = { enabled = true, icon = '    ▶' },
            level_6 = { enabled = true, icon = '     ⤷' },
          },
        },
      },
    }, -- Allows for use of icons
    ["core.keybinds"] = {
      config = {
        default_keybinds = false
      }
    },
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
        toc_split_placement = 'left',
        default_toc_mode = "split",
      }
    },
    ["core.export"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      }
    },
    ["core.export.markdown"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      }
    },
    ["core.integrations.treesitter"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        norg = {
          url = "https://github.com/nvim-neorg/tree-sitter-norg",
          files = { "src/parser.c", "src/scanner.cc" },
          branch = "main",
        },
        norg_meta = {
          url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
          files = { "src/parser.c" },
          branch = "main",
        },
      }
    }
  },
}



vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.org", "*.norg", "*.md" },
  callback = function()
    vim.opt.conceallevel = 2
    --vim.opt.concealcursor = 'n'
    vim.cmd [[
    hi conceal guifg=#31748f guibg=#15131E
    syn match keyword /@code/ containedin=ALL conceal cchar=
    syn match keyword /@end/ containedin=ALL conceal cchar= 
    syn match keyword /@/ containedin=ALL conceal cchar= 
    ]]
  end
})
