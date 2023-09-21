return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        -- fzf filtering for telescope
        --        {
        --            "nvim-telescope/telescope-fzf-native.nvim",
        --            build = "make",
        --        },
        "nvim-telescope/telescope-ui-select.nvim", -- Use telescope to override vim.ui.select
        -- "nvim-telescope/telescope-dap.nvim", -- Use telescope for debugging
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local fb_actions = require "telescope".extensions.file_browser.actions
        local telescope = require("telescope")
        telescope.setup({
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                git_files = {
                    theme = "ivy",
                },
            },
            extensions = {
                --              fzf = {
                --                  theme = "ivy",
                --                  fuzzy = true,                   -- let me make typos in file names please
                --                  override_generic_sorter = true, -- override the generic sorter
                --                  override_file_sorter = true,    -- override the file sorter
                --                  case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                --              },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    } },
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
                    mappings = {
                        ["i"] = {
                            -- custom mappings here
                        },
                        ["n"] = {
                            -- default mappings
                            ["c"] = fb_actions.create,
                            ["r"] = fb_actions.rename,
                            ["m"] = fb_actions.move,
                            ["y"] = fb_actions.copy,
                            ["d"] = fb_actions.remove,
                            ["o"] = fb_actions.open,
                            ["g"] = fb_actions.goto_parent_dir,
                            ["e"] = fb_actions.goto_home_dir,
                            ["w"] = fb_actions.goto_cwd,
                            ["t"] = fb_actions.change_cwd,
                            ["f"] = fb_actions.toggle_browser,
                            ["h"] = fb_actions.toggle_hidden,
                            ["s"] = fb_actions.toggle_all,
                        },
                    },
                },
            },
        }
        )
        -- telescope.load_extension("fzf")
        --  telescope.load_extension("dap")
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
    end,
    keys = {
        {
            "<Leader>ff",
            "<cmd>Telescope find_files<CR>",
            desc = "Find files",
        },
        {
            "<Leader>fg",
            "<cmd>Telescope git_files<CR>",
            desc = "Find git_files",
        },

        {
            "<Leader>gg",
            "<cmd>Telescope current_buffer_fuzzy_find<CR>",
            desc = "Grep",
        },
        {
            "<Leader>gi",
            "<cmd>Telescope lsp_implementations<CR>",
            desc = "Go to implementation",
        },
        {
            "<Leader>gr",
            "<cmd>Telescope lsp_references<CR>",
            desc = "Go to references",
        },
        {
            "<Leader>gd",
            "<cmd>Telescope lsp_definitions<CR>",
            desc = "Go to definition",
        },
        {
            "<Leader>gD",
            "<cmd>Telescope lsp_declarations<CR>",
            desc = "Go to declarations",
        },
        {
            "<Leader>gt",
            "<cmd>Telescope lsp_type_definitions<CR>",
            desc = "Go to type definition",
        },
        { "<Leader>e", ":Telescope file_browser<CR><esc>", desc = "toggle file browser" },
        {
            "<Leader>E",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR><esc>",
            desc =
            "open file browser with current file showing"
        },
    }
}
