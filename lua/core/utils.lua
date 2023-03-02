local fn = vim.fn

local M = {
	interval = 500,
	cpu = 0.0,
}

--{{ 合并两个table
M.mergeTable = function(table1, table2)
	local c_table = {}
	local flag

	for k, v in ipairs(table1) do
		flag = false
		for e, value in ipairs(c_table) do
			if value == v then
				flag = true
			end
		end
		if flag == false then
			table.insert(c_table, v)
		end
	end

	for k, v in ipairs(table2) do
		flag = false
		for e, value in ipairs(c_table) do
			if value == v then
				flag = true
			end
		end
		if flag == false then
			table.insert(c_table, v)
		end
	end

	return c_table
end
--}}}

--{{ 文件路径称转换唯一字符串
M.file_key = function(file_path)
	file_path = string.gsub(file_path, "^" .. os.getenv("HOME"), "~")
	file_path = string.gsub(file_path, "/", "=+")
	return file_path .. "="
end
--}}}

--{{ 插件view文件和当前文件
M.check_mkview = function(file_path)
	if not M.file_exists(file_path) then
		return false
	end
	return true
end
--}}}

--{{ 文件路径唯一字符串转换成路径
M.file_key_to_path = function(file_key)
	local path = string.gsub(file_key, "=+", "/")
	path = string.gsub(file_key, "=$", "")
	path = string.gsub(path, "^~", os.getenv("HOME"))
	return path
end
--}}

--{{ 获取当前nvim的pid
M.latest_pid = function()
	local pid_str = io.popen("ps -C nvim -o %pid | tac | awk 'NR==1 {print $1}'"):read("*a")
	local pid = string.match(pid_str, "%d+")
	return pid
end
M.pid = M.latest_pid()
--}}}

---{{ 获取当前nvim的cpu负载
M.cpu_load = function()
	local cpu_load_string = io.popen("ps -p " .. M.pid .. " -o %cpu | awk 'NR==2 {print $1}'"):read("*a")
	local cpu_load = string.match(cpu_load_string, "([0-9%.]+)")
	return cpu_load or 0
end

--}}}

-- 异步刷新
local timer = vim.loop.new_timer()
timer:start(
	0,
	M.interval,
	vim.schedule_wrap(function()
		M.cpu = M.cpu_load()
	end)
)

--{{ 判断文件是否存在
M.file_exists = function(file_path)
	local file = io.open(file_path)
	if file then
		file:close()
		return true
	else
		return false
	end
end
--}}}

--{{ 获取高亮组颜色
M.get_color = function(group, attr)
	return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end
--}}}

--{{ 遍历当前窗口的所有bufer 获取buffer,返回buffer列表
M.get_buf_list = function()
	local bufs = {}
	local winnr = fn.winnr("$")
	for i = 1, winnr do
		local win_id = fn.win_getid(i)
		local buf_id = fn.winbufnr(win_id)
		table.insert(bufs, buf_id)
	end
	return bufs
end
--}}}

--{{ 安装插件并加载
function M.insert_load_plugin(plug, path, config)
	local lazypath = vim.fn.stdpath("data") .. "/lazy/" .. path
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--depth 1",
			"https://github.com/" .. plug .. ".git",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
	config()
end
--}}}

function M.asynerquire(mode)
	vim.defer_fn(function()
		require(mode)
	end, 0)
end
return M
