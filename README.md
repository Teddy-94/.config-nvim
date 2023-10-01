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
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) File browser, file finder, and much more!

* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for lsp features
* [mason.nvim](https://github.com/williamboman/mason.nvim) for handling lsp servers
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) autocomplete

## Nice to have

* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git statuses
* [lualine](https://github.com/nvim-lualine/lualine.nvim) for a nicer statusline
* [mini.surround](https://github.com/echasnovski/mini.surround)
* [which-key](https://github.com/folke/which-key.nvim) 


## Color
These are the color schemes I rotate between. In all applicable cases, italics and strikethroughs are disabled.
* [onehalf](https://github.com/BBaoVanC/onehalf) onehalf-dark
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) variant: storm
* [catppuccin](https://github.com/catppuccin/nvim) variant: frappe
* [rose-pine](https://github.com/rose-pine/neovim) variant: moon
* [gruvbox](https://github.com/gruvbox-community/gruvbox)
