local has_ts, lsp_signature = pcall(require, "lsp_signature")
if not has_ts then return end
local cfg = {
	debug = false,
	verbose = false,
	bind = true,
	doc_lines = 10,
	floating_window = true,
	floating_window_above_cur_line = true,
	floating_window_off_x = 70,
	floating_window_off_y = 10,
	fix_pos = true,
	hint_enable = true,
	hint_prefix = "🐼 ",
	hint_scheme = "String",
	hi_parameter = "LspSignatureActiveParameter",
	max_height = 12,
	max_width = 50,
	handler_opts = {
		border = "rounded"
	},

	always_trigger = false,

	auto_close_after = nil,
	extra_trigger_chars = {},
	zindex = 200,

	padding = '',

	transparency = nil,
	shadow_blend = 36,
	shadow_guibg = 'Black',
	timer_interval = 200,
	toggle_key = nil
}


lsp_signature.setup(cfg)
