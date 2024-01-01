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
  { import = "colors" }, -- Set colorscheme
  { import = "lsp-setup" }, -- LSP setup
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",    -- Use telescope to override vim.ui.select
      "nvim-telescope/telescope-file-browser.nvim", -- Use Telescope as file browser
    }
  },
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "lewis6991/gitsigns.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",
  { "echasnovski/mini.surround", opts = {} },
  { "folke/which-key.nvim",      opts = {} },
  "folke/trouble.nvim",
})
