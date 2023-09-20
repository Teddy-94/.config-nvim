## Teddys NeoVim config

A minimal neovim config.

It uses as few plugins as I can manage while still getting a full set of features.

The main Vim setup is done in init.lua, which also sets up lazy.nvim to manage plugins and lsp-zero.nvim to handle the lsp stuff.

# Dependencies
These are the core plugins for base functionality
* [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) for lsp features
* [mason.nvim](https://github.com/williamboman/mason.nvim) for handling lsp servers
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding and as a file browser
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git statuses  
* [trouble.nvim](https://github.com/folke/trouble.nvim) for error messages

These are more optional plugins
* [which-key](https://github.com/folke/which-key.nvim) for learning the less common keybindings
* [lualine](https://github.com/nvim-lualine/lualine.nvim) for a nicer statusline

These are the color schemes I regularly rotate between. (disabled italics for applicable colorschemes)
* [onehalf](https://github.com/BBaoVanC/onehalf) onehalf-dark
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) tokyonight-storm
* [catppuccin](https://github.com/catppuccin/nvim) catppuccin-frappe
* [rose-pine](https://github.com/rose-pine/neovim)
* [gruvbox](https://github.com/ellisonleao/gruvbox.nvim)
