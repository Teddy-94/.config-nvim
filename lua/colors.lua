return {
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
                transparent_mode = false,
            })
        end,
    },
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = false,
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
        end,
    },
}
