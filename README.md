## Teddys NeoVim config

A minimal neovim config.

# Requirements
* Neovim 0.12+ (uses the builtin `vim.pack` plugin manager)
* [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg` on your PATH) for file search and grep
* [fzf](https://github.com/junegunn/fzf) (`fzf` on your PATH) used by fzf-lua

# Structure
`init.lua` defines the basic vim options and keybindings, then loads the plugin setup files in `lua/`.
Each file in `lua/` installs its plugins with `vim.pack.add()` and configures them.

Plugin versions are pinned in `nvim-pack-lock.json`, which is committed so a fresh install gets the same revisions.

# Managing plugins
* Update: `:lua vim.pack.update()`, review the changes, then `:w` to apply or `:q` to discard. Commit the updated lockfile.
* Roll back: restore `nvim-pack-lock.json` from git, then `:lua vim.pack.update(nil, { target = "lockfile" })`
* Remove: delete the `vim.pack.add()` entry, restart, then `:lua vim.pack.del({ "plugin-name" })`

# Dependencies
I have made an effort to use as few dependencies/plugins as possible, these are the ones I don't want to go without.

## Base config
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/mason-org/mason.nvim), [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim) LSP features
* [fzf-lua](https://github.com/ibhagwan/fzf-lua) Fuzzy finder for files, grep and LSP results
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [diffview](https://github.com/sindrets/diffview.nvim) Git integrations

## Nice to have
* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) File explorer
* [oil.nvim](https://github.com/stevearc/oil.nvim) File explorer and more
* [mini.surround](https://github.com/nvim-mini/mini.surround) Surround actions

## Builtin instead of plugins
* Commenting: Neovim's builtin `gc`/`gcc`, mapped to `<leader>c`
* Undo tree: the bundled `nvim.undotree` package, mapped to `<leader>u`
* Completion: native `'autocomplete'` with LSP items via `vim.lsp.completion`
* Statusline: the default statusline (diagnostics and progress included)

## Color
I always disable italics and strikethroughs where applicable.
* [kanagawa](https://github.com/teddy-94/kanagawa.nvim) variant: wave
