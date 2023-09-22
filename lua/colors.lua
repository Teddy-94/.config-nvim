return {
    {
        "BBaoVanC/onehalf",
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            -- vim.cmd([[colorscheme onehalfdark]])
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                variant = 'auto',      -- 'auto'|'main'|'moon'|'dawn'
                dark_variant = 'moon', --  'main'|'moon'|'dawn'
                disable_italics = true,
                disable_background = true,
                disable_float_background = true,
            })
            -- vim.cmd([[colorscheme rose-pine]])
        end,
    },
    {
        "gruvbox-community/gruvbox",
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            -- vim.cmd([[colorscheme gruvbox]])
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = false,
            })
            -- vim.cmd([[colorscheme gruvbox]])
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                background = {      -- :h background
                    light = "latte",
                    dark = "frappe",
                },
                styles = {
                    comments = {},
                    conditionals = {},
                }
            }
            )
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}