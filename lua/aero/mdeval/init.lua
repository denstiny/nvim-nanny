
local has_ts, plug = pcall(require, "mdeval")
if not has_ts then return end
plug.setup({
  -- Don't ask before executing code blocks
  allowed_file_types={'rust', 'haskell','cpp','c','python'},
  require_confirmation=false,
  -- Change code blocks evaluation options.
  eval_options = {
    -- Set custom configuration for C++
    cpp = {
      command = {"clang++", "-std=c++20", "-O0"},
      default_header = [[
    #include <iostream>
    #include <vector>
    using namespace std;
      ]]
    },
    -- Add new configuration for Racket
    racket = {
      command = {"racket"},        -- Command to run interpreter
      language_code = "racket",    -- Markdown language code
      exec_type = "interpreted",   -- compiled or interpreted
      extension = "rkt",           -- File extension for temporary files
    },
  },
})
