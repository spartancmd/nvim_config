return {
    "nvim-telescope/telescope.nvim", 
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        "nvim-tree/nvim-web-devicons",
        { 
            "nvim-telescope/telescope-fzf-native.nvim", 
             build = "make",
             cond = function()
                 return vim.fn.executable("make") == 1 -- check if make exists on this system
             end,
        },
    },

    cmd = "Telescope",

    keys = {
        {
            "<leader>ff",
            function() 
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>fg",
            function() 
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>fb",
            function() 
                require("telescope.builtin").buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fh",
            function() 
                require("telescope.builtin").help_tags()
            end,
            desc = "Help tags",
        },
    },

    opts = {
        defaults = {},
    },

    config = function(_, opts) 
        local telescope = require("telescope")
        telescope.setup(opts)

        local ok, err_message = pcall(telescope.load_extension, "fzf")
        if not ok then 
            vim.notify(
                "[navigation/telescope.lua] Failed to load extension 'fzf':\n" .. err_message, 
                vim.log.levels.WARN
            )
        end
    end,
}
