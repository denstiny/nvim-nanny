local _, luapad = pcall(require, "luapad")
if not _ then return end

luapad.setup {
  count_limit = 150000,
  preview = false,
  error_indicator = false,
  eval_on_move = true,
  error_highlight = 'WarningMsg',
  split_orientation = 'horizontal',
  on_init = function()
    print 'Hello from Luapad!'
  end,
  context = {
    the_answer = 42,
    shout = function(str) return (string.upper(str) .. '!') end
  }
}
