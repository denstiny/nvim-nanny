local has_tasks, tasks = pcall(require, "tasks")
if not has_tasks then return end

local source_npm = require("tasks.sources.npm")
local source_tasksjson = require("tasks.sources.tasksjson")
local builtin = require("tasks.sources.builtin")

require("telescope").load_extension("tasks")

tasks.setup({
	sources = {
		npm = source_npm,
		vscode = source_tasksjson,
		utils = builtin.new_builtin_source({
			sleep = {
				fn = function(ctx)
					local pasync = require("plenary.async")

					pasync.util.sleep(10000)
				end,
			},

            vim_cmd = {
                vcmd = "echo 'ok'"
            },

            shell_cmd = {
                cmd = "make test"
            }
		}),
	},
})
