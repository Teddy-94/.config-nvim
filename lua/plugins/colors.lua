return {
    {
        "BBaoVanC/onehalf",
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
        end
    },
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = 'auto',
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'moon',
                disable_italics = true,
            })
        end

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
        end
    },
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                background = {      -- :h background
                    light = "latte",
                    dark = "frappe",
                },
                styles = {
                    comments = {},
                    conditionals = {},
                }
            })
        end
    }

}
