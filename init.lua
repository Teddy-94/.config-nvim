-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Misc. commands
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--paste no overwrite what you have in register
vim.keymap.set("x", "p", "\"_dP")

-- Yank/paste to and from system clipboard
vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("n", "p", "\"+p")
vim.keymap.set("v", "p", "\"+p")

-- navigate window panes
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "Q", "<nop>")

-- vim options
vim.opt.scrolloff = 8
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorline = true

vim.opt.updatetime = 50

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false

-- uses lazy.nvim https://github.com/folke/lazy.nvim
-- :help lazy.nvim.txt` for more info
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
require("lazy").setup("plugins")

-- colors
local myColorschemes = { "tokyonight-storm", "rose-pine-moon", "catppuccin-frappe", "gruvbox" }
local selectedColorscheme = myColorschemes[math.random(#myColorschemes)]
vim.cmd("colorscheme " .. selectedColorscheme)
vim.api.nvim_echo({ { selectedColorscheme, "Normal" } }, true, {})

-- lsp setup using lsp-zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- local smallpoon = require("smallpoon")
-- vim.keymap.set("n", "<Leader>M", ":lua smallpoon.say_hello<CR>");
