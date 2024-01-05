-- [Plugin setup]
-- Bootsrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- If a plugin requires setup etc, it goes in a separate file, that file is then imported here which tells Lazy.nvim to install it.
  { import = "colors" },    -- Set colorscheme
  { import = "lsp-setup" }, -- LSP setup
  { import = "nvim-cmp-setup" },
  { import = "telescope-setup" },
  { import = "gitsigns-setup" },
  { import = "lualine-setup" },
  { import = "nvim-tree-setup" },
  { "echasnovski/mini.surround",  opts = {} },
  { "folke/which-key.nvim",       opts = {} },
  { import = "trouble-nvim-setup" },
  { "numToStr/Comment.nvim",      opts = {} }
})
