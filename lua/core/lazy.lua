local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
    local result = vim.system({
        'git',
        'clone',
        '--branch=stable',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    }):wait()

    if result.code ~= 0 then
        error(
            'Failed to clone lazy.nvim.\n\n'
            .. 'Git exited with code ' .. result.code .. '\n\n'
            .. 'Error message: \n'
            .. (result.stderr or 'No error message.')
        )
    end
end

vim.opt.rtp:prepend(lazypath) -- prepend (instead of append) to give it a higher priority in runtime path (rtp)

require("lazy").setup({
    spec = {
        { import = "plugins" }, -- loads it first via lua's require. Then lazy handles the content of init.lua
    },
})
