## Teddys NeoVim config

A minimal and blazingly fast neovim config.

# Structure
The init.lua file sources the keybindings and the basic vim options from /lua/keybindings.lua and /lua/options.lua.
It then initializes Lazy.nvim, which in turn loads the colorscheme from /lua/colors.lua, Telescope from /lua/telescope.lua, and the lsp related plugins from /lua/lsp-setup.lua.
Finally, lazy installs the rest of the plugins.

# Dependencies
I have made an effort to use as few dependencies/plugins as possible, these are the ones I don't want to go without.

## Base config:

* [lazy.nvim](https://github.com/folke/lazy.nvim) Plugin manager.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) File finder and much more!

* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for lsp features
* [mason.nvim](https://github.com/williamboman/mason.nvim) for handling lsp servers
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) autocomplete
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git intergration

## Nice to have

* [lualine](https://github.com/nvim-lualine/lualine.nvim) for a nicer statusline
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) File explorer
* [mini.surround](https://github.com/echasnovski/mini.surround)
* [undotree](https://github.com/mbbill/undotree)
* [which-key](https://github.com/folke/which-key.nvim) 
* [comment.nvim](https://github.com/numToStr/Comment.nvim)


## Color
These are the color schemes I rotate between.
I always disable italics and strikethroughs, and use transparent background.
* [kanagawa]("https://github.com/rebelot/kanagawa.nvim") variant: dragon
* [rose-pine](https://github.com/rose-pine/neovim) variant: moon
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) variant: moon
