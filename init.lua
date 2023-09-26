-- Main init.lua.

-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Import Options and Keymaps
require("options")
require("keymaps")

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
    { import = "colors" },         -- Set colorscheme
    { import = "telescope-nvim" }, -- Install Telescope
    { import = "lsp-setup" },      -- LSP setup
    { 'echasnovski/mini.completion', version = '*',                                               opts = {} },
    { "nvim-lualine/lualine.nvim",   dependencies = { "nvim-tree/nvim-web-devicons", opts = {} }, opts = {} },
    { "lewis6991/gitsigns.nvim",     opts = {} },
    { 'echasnovski/mini.surround',   version = '*',                                               opts = {} },
    { "folke/which-key.nvim",        opts = {} },
    { "folke/trouble.nvim",          opts = { auto_preview = false, } },
})

vim.cmd("colorscheme gruvbox")
