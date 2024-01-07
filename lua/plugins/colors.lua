local function setColorscheme()
  vim.cmd.colorscheme('rose-pine')
end

return {
  {
    "xiyaowong/transparent.nvim",
    opts = {},
    config = function()
      vim.api.nvim_command(":TransparentEnable")
    end
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = 'moon',      -- 'auto'|'main'|'moon'|'dawn'
        dark_variant = 'moon', --  'main'|'moon'|'dawn'
        disable_italics = true,
        disable_background = vim.g.transparent_enabled,
        disable_float_background = false,
      })
      setColorscheme()
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
        transparent_mode = vim.g.transparent_enabled,
      })
      setColorscheme()
    end,
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
        style = "moon",
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
        transparent = vim.g.transparent_enabled,
      })
      setColorscheme()
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        transparent_background = vim.g.transparent_enabled,
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
      setColorscheme()
    end,
  },
}
