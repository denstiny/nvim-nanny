local has_ts, competitest = pcall(require, "competitest")
if not has_ts then return end
competitest.setup {
  local_config_file_name = ".competitest.lua",

  floating_border = "rounded",
  floating_border_highlight = "FloatBorder",
  picker_ui = {
    width = 0.2,
    height = 0.3,
    mappings = {
      focus_next = { "j", "<down>", "<Tab>" },
      focus_prev = { "k", "<up>", "<S-Tab>" },
      close = { "<esc>", "<C-c>", "q", "Q" },
      submit = { "<cr>" },
    },
  },
  editor_ui = {
    popup_width = 0.4,
    popup_height = 0.6,
    show_nu = false,
    show_rnu = false,
    normal_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = "<C-s>",
      cancel = { "q", "Q" },
    },
    insert_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = "<C-s>",
      cancel = "<C-q>",
    },
  },
  runner_ui = {
    --total_width = 0.8,
    --total_height = 0.8,
    --selector_width = 0.3,
    selector_show_nu = false,
    selector_show_rnu = false,
    show_nu = false,
    show_rnu = false,
    mappings = {
      run_again = "R",
      run_all_again = "<C-r>",
      kill = "K",
      kill_all = "<c-k>",
      view_input = { "i", "I" },
      view_output = { "a", "A" },
      view_stdout = { "o", "O" },
      view_stderr = { "e", "E" },
      close = { "q", "Q" },
    },
    viewer = {
      width = 0.5,
      height = 0.5,
      show_nu = false,
      show_rnu = false,
      close_mappings = { "q", "Q" },
    },
  },

  save_current_file = true,
  save_all_files = false,
  compile_directory = ".",
  compile_command = {
    c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "build/$(FNOEXT)" } },
    cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "build/$(FNOEXT)" } },
    rust = { exec = "rustc", args = { "$(FNAME)" } },
    java = { exec = "javac", args = { "$(FNAME)" } },
  },
  running_directory = ".",
  run_command = {
    c = { exec = "./build/$(FNOEXT)" },
    cpp = { exec = "./build/$(FNOEXT)" },
    rust = { exec = "./build/$(FNOEXT)" },
    python = { exec = "python", args = { "$(FNAME)" } },
    java = { exec = "java", args = { "$(FNOEXT)" } },
  },
  multiple_testing = -1,
  maximum_time = 5000,

  testcases_directory = "./testCases/",
  testcases_use_single_file = false,
  companion_port = 27121,
  receive_print_message = true,
}
