return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-ui-select.nvim",    -- Use telescope to override vim.ui.select
        "nvim-telescope/telescope-file-browser.nvim", -- Use Telescope as file browser
    },
    config = function()
        local telescope = require("telescope")
        local fb_actions = require "telescope".extensions.file_browser.actions
        telescope.setup({
            defaults = {
                wrap_results = true,
                path_display = { "absolute" },
                initial_mode = "normal",
            },
            pickers = {
                find_files = { theme = "ivy", },
                git_files = { theme = "ivy", },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_cursor {}
                },
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = false,
                    mappings = {
                        ["n"] = {
                            ["a"] = fb_actions.create,
                        }
                    }
                }
            }
        })
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
    end

}
