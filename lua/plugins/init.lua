local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
    -- choose one dashboard
    -- { import = "plugins.alpha-nvim" },

    -- some builin managers
    { import = "plugins.mini" },
    { import = "plugins.snacks" }, -- also configures dashboard

    -- programming languages related stuff (LSP, Formatters...)
    { import = "plugins.languages" },

    { import = "plugins.colorschemes" },
    { import = "plugins.neo-tree" },
    { import = "plugins.telescope" },
    { import = "plugins.autopairs" },
    { import = "plugins.comment" },
    { import = "plugins.todo-comments" },
    -- { import = "plugins.guess-indent" },
    { import = "plugins.gitsigns" },
    { import = "plugins.lualine" },
    { import = "plugins.which-key" },
    { import = "plugins.completions" },
    { import = "plugins.nvim-ufo" },
    { import = "plugins.toggleterm" },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})

-- call setup for plugin keymaps (not all plugin related keymaps are defined there)
require("plugins.keymaps")

-- setup the colorscheme
vim.cmd.colorscheme("gruvbox")

-- for diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
