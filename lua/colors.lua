return {
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = 'moon',      -- 'auto'|'main'|'moon'|'dawn'
        dark_variant = 'moon', --  'main'|'moon'|'dawn'
        disable_italics = true,
        disable_background = false,
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
    'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
        comments = { italic = true },
        keywords = { italic = true },
        vim.cmd.colorscheme 'tokyonight-moon'
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

      -- vim.cmd("colorscheme rose-pine")
    end,
  },
}
