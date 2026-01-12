## Teddys NeoVim config

A minimal and blazingly fast neovim config.

# Structure
The init.lua file defines the keybindings and the basic vim options.
It then installs the plugins using the Neovim builtin plugin manager.

# Dependencies
I have made an effort to use as few dependencies/plugins as possible, these are the ones I don't want to go without.

## Base config:
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/williamboman/mason.nvim) Lsp features
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Autocomplete
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) File finder and much more!
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [neogit](https://github.com/NeogitOrg/neogit) Git intergrations

## Nice to have
* [lualine](https://github.com/nvim-lualine/lualine.nvim) Statusline
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) File explorer
* [oil.nvim](https://github.com/stevearc/oil.nvim) File explorer and more
* [undotree](https://github.com/mbbill/undotree)
* [fidget.nvim](https://github.com/j-hui/fidget.nvim) Notifications
* [trouble](https://github.com/folke/trouble.nvim) Diagnostics
* [mini.surround](https://github.com/echasnovski/mini.surround)
* [comment.nvim](https://github.com/numToStr/Comment.nvim)
* [nvim-colorizer](https://github.com/catgoose/nvim-colorizer.lua)

## Color
These are the color schemes I rotate between.
I always disable italics and strikethroughs where applicable.
* [kanagawa](https://github.com/teddy-94/kanagawa.nvim) variant: wave
* [rose-pine](https://github.com/rose-pine/neovim) variant: moon
* [vscode](https://github.com/Mofiqul/vscode.nvim)
