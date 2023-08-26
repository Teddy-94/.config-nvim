return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        -- fzf filtering for telescope
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-telescope/telescope-ui-select.nvim", -- Use telescope to override vim.ui.select
        -- "nvim-telescope/telescope-dap.nvim", -- USe telescope for debugging
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,                   -- let me make typos in file names please
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_cursor(),
                },
            },
        })
        telescope.load_extension("fzf")
        --  telescope.load_extension("dap")
        telescope.load_extension("ui-select")
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
            desc = "Go to implementation",
        },
    }
}
