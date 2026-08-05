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
        {
            "<leader>fn",
            "<cmd>Telescope notify<CR>",
            desc = "View Notifications",
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Find files",
        },
        {
            "<leader>fc",
            function()
                local telescope = require("telescope.builtin")
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                telescope.colorscheme({
                    enable_preview = true,

                    attach_mappings = function(prompt_bufnr)
                        local function set_colorscheme()
                            local selection = action_state.get_selected_entry()

                            if selection then
                                local theme = selection.value

                                actions.close(prompt_bufnr)

                                vim.cmd.colorscheme(theme)

                                vim.fn.writefile({ theme }, vim.fn.stdpath("data") .. "/last-theme")
                            end
                        end

                        actions.select_default:replace(set_colorscheme)

                        return true
                    end,
                })
            end,
            desc = "Colorscheme picker",
        },
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
