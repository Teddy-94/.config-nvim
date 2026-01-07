vim.pack.add({
  "https://github.com/Mofiqul/vscode.nvim",
  "https://github.com/rose-pine/neovim",
  "https://github.com/teddy-94/kanagawa.nvim"
})
require("rose-pine").setup({
  variant = 'moon',      -- 'auto'|'main'|'moon'|'dawn'
  dark_variant = 'moon', --  'main'|'moon'|'dawn'
  disable_italics = true,
  disable_background = vim.g.transparent_enabled,
  disable_float_background = vim.g.transparent_enabled,
})

require 'kanagawa'.setup({
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  typeStyle = {},
  transparent = vim.g.transparent_enabled,
  theme = "wave",
})

vim.cmd("colorscheme kanagawa")
