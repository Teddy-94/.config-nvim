local function setColorscheme()
  vim.cmd.colorscheme('vscode')
end

return {
  {
    "xiyaowong/transparent.nvim",
    opts = {},
    config = function()
      vim.api.nvim_command(":TransparentDisable")
    end
  },
  {
    "slugbyte/lackluster.nvim",
  },
  {
    "Mofiqul/vscode.nvim"
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        }
      })
      setColorscheme()
    end
  },
  {
    -- "rebelot/kanagawa.nvim",
    "teddy-94/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = vim.g.transparent_enabled,
        theme = "dragon",
      })
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
        disable_float_background = vim.g.transparent_enabled,
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
}
