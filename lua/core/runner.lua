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

local function find_default_executable()
	if not is_windows then
		return ""
	end

	local files = vim.fn.globpath(BUILD_DIR, "*.exe", false, true)

	if #files == 1 then
		return vim.fn.fnamemodify(files[1], ":t:r")
	end

	return ""
end

local function executable()
	local default = find_default_executable()

	local name = vim.fn.input("Executable: ", default)

	if name == "" then
		return nil
	end

	if is_windows and not name:match("%.exe$") then
		name = name .. ".exe"
	end

	return BUILD_DIR .. "/" .. name
end

function M.build_cpp()
	term("cmake --build " .. BUILD_DIR)
end

function M.run_cpp()
	local exe = executable()

	if not exe then
		return
	end

	term(exe)
end

function M.build_and_run_cpp()
	local exe = executable()

	if not exe then
		return
	end

	term("cmake --build " .. BUILD_DIR .. " && " .. exe)
end

function M.run_py()
	local file = vim.fn.expand("%:p")

	term("python " .. vim.fn.shellescape(file))
end

return M
