--[[--
File              : treesitter.lua
Author            : denstiny Anonymity <2254228017@qq.com>
Date              : 04.03.2021
Last Modified Date: 04.03.2021
Last Modified By  : denstiny Anonymity <2254228017@qq.com>
--]]--

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false将禁用整个扩展
    -- disable = { "c", "rust" },  -- 将被禁用的语言列表
  },
}

-- 代码缩进
require'nvim-treesitter.configs'.setup {
    indent = {
      enable = false  -- 奇怪的缩进 弃用
    },
  }

-- 高亮显示光标下符号的定义
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
  },
}

-- 高亮当前函数范围 有点烦人我关了
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}

-- 智能重命名
-- 因为coc已经有了这个功能，所以暂且关掉
require'nvim-treesitter.configs'.setup {
  refactor = {
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "grr", -- 设置快捷键为 grr
      },
    },
  },
}

-- 转到定义
-- 和coc功能重复，关掉
 require'nvim-treesitter.configs'.setup {
   refactor = {
     navigation = {
       enable = false,
       keymaps = {
         goto_definition = "gnd",
         list_definitions = "gnD",
         list_definitions_toc = "gO",
         goto_next_usage = "<a-*>",
         goto_previous_usage = "<a-#>",
       },
     },
   },
 }

-- 游乐园
require "nvim-treesitter.configs".setup {
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

