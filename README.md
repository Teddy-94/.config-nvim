## Teddys NeoVim config

A minimal neovim config.

It uses as few plugins as I can manage while still getting a full set of features.

The main Vim setup is done in init.lua, which also sets up lazy.nvim to manage plugins and lsp-zero.nvim to handle the lsp stuff.

# Dependencies
These are the core plugins for base functionality
* [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) for lsp features
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git statuses  
* [trouble.nvim](https://github.com/folke/trouble.nvim) for error messages

These are more optional plugins
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
* [which-key](https://github.com/folke/which-key.nvim) for learning the keymaps
* [lualine](https://github.com/nvim-lualine/lualine.nvim) for a nicer statusline
* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) for a more beautiful file explorer 

These are the color schemes I regularly rotate between. (disabled italics for applicable colorschemes)
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) tokyonight-storm
* [catppuccin](https://github.com/catppuccin/nvim) catppuccin-frappe
* [rose-pine](https://github.com/rose-pine/neovim)
* [gruvbox](https://github.com/ellisonleao/gruvbox.nvim)