-- Main init.lua.

-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Import Options and Keymaps
require("options")
require("keymaps")

-- lazy.nvim plugin management
require("lazy-nvim-setup")

-- plugins with special setups
require("telescope-setup")
require("gitsigns-setup")
require("cmp-setup")
require("nvim-tree-setup")
require("trouble-nvim-setup")
require("lualine-setup")

vim.cmd("colorscheme catppuccin")
