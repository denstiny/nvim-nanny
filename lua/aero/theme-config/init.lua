
local has_ts, plug = pcall(require, "telescope")
if not has_ts then return end

plug.setup({
    colorscheme = "rose_pine",
    styles = {
      	["function"] = { style = 'italic' },
       	functionbuiltin = { style = 'italic' },
       	variable = { style = 'italic' },
        	variableBuiltIn = { style = 'italic' },
      	parameter  = { style = 'italic' },
    },
})
