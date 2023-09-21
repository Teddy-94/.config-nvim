## Teddys NeoVim config

A minimal and blazingly fast neovim config.

# Structure
All keybindings, vim options and settings, and the lsp setup goes in init.lua. The lsp related plugins are placed in plugins/lsp.lua, all colorthemes go into plugins/colors.lua, and the rest of the plugins have their own file in the plugins folder. The reason for splitting the files into a core config and plugins folder is that when editing or changing plugins, if there is an error in one of the plugins and all config is in init.lua, nvim won't be able to set any of the config and you are left with the default nvim... And that's no fun.

# Dependencies
I have made and effort to use as few dependencies/plugins as possible, these are the ones I don't want to go without.
## Base config:
Most of the funcitonality I use is built into NeoVim out of the box, however there are two main core features of an IDE that need plugins. These features are 1. a decent way to browse and manage files. 2. lsp integration. While nvim has both a file manager and core lsp interop features, the "core plugins" telescope, nvim-lspconfig, and mason really improve quality of life.

* [lazy.nvim](https://github.com/folke/lazy.nvim) Plugin manager.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding and as a file browser

* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for lsp features
* [mini.completion](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md)
* [mason.nvim](https://github.com/williamboman/mason.nvim) for handling lsp servers

## Nice to have
The out of the box statusline really isn't doing it for me, so I replace that with lualine. Furthermore, getting hints for those rarely used keybindings is really helpful, hence the which-key plugin. Finally, seeing gitsigns and adding some functionality regarding surrounding tags is a good improvement.
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git statuses  
* [mini.surround](https://github.com/echasnovski/mini.surround)
* [which-key](https://github.com/folke/which-key.nvim) for learning the less common keybindings
* [lualine](https://github.com/nvim-lualine/lualine.nvim) for a nicer statusline

## Color
These are the color schemes I rotate between. In all applicable cases, italics and strikethroughs are disabled.
* [onehalf](https://github.com/BBaoVanC/onehalf) onehalf-dark
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) variant: storm
* [catppuccin](https://github.com/catppuccin/nvim) variant: frappe
* [rose-pine](https://github.com/rose-pine/neovim) variant: moon
* [gruvbox](https://github.com/gruvbox-community/gruvbox)
