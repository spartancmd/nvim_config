local M = {}

local BUILD_DIR = "build"

local is_windows = vim.uv.os_uname().sysname == "Windows_NT"

local function term(cmd)
	Snacks.terminal.open(cmd, {
		auto_close = false,
		win = {
			position = "bottom",
		},
	})
end

local cached_target

local function find_target()
	if cached_target then
		return cached_target
	end
	local cmake = vim.fs.joinpath(vim.fn.getcwd(), "CMakeLists.txt")

	if vim.fn.filereadable(cmake) == 0 then
		return nil
	end

	for _, line in ipairs(vim.fn.readfile(cmake)) do
		local target = line:match("^%s*add_executable%s*%(%s*([%w_-]+)")
		if target then
			cached_target = target
			return cached_target
		end
	end

	return nil
end

local function executable_name()
	local target = find_target()

	if not target then
		return nil
	end

	if is_windows then
		return vim.fs.joinpath(BUILD_DIR, target .. ".exe")
	end

	return vim.fs.joinpath(BUILD_DIR, target)
end

function M.build_cpp()
	term("cmake --build " .. BUILD_DIR)
end

function M.run_cpp()
	local exe = executable_name()

	if not exe then
		vim.notify("No executable target found", vim.log.levels.ERROR)
		return
	end

	term(vim.fn.shellescape(exe))
end

function M.build_and_run_cpp()
	local exe = executable_name()

	if not exe then
		vim.notify("No executable target found", vim.log.levels.ERROR)
		return
	end

	term("cmake --build " .. BUILD_DIR .. " && " .. exe)
end

function M.run_py()
	-- vim.fn.expand("%:p") returns filepath of the current buffer
	local file = vim.fn.expand("%:p")

	-- vim.fn.shellescape(cmd) wraps the cmd-string into ''
	term("python " .. vim.fn.shellescape(file))
end

return M
