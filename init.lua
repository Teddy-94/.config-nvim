-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Misc. commands
-- C-s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")
-- C-l to clear any highlights
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
vim.keymap.set("n", "<C-t>", ":bel new<CR>:term<CR>a")
-- map esc to get into normal mode when in a term buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--paste no overwrite what you have in register
vim.keymap.set({ "x", "v" }, "p", "P")

-- navigate window panes
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")

-- make window resizing easier
vim.keymap.set("n", "<C-w>l", "5<C-w>>")
vim.keymap.set("n", "<C-w>h", "5<C-w><")
vim.keymap.set("n", "<C-w>k", "5<C-w>+")
vim.keymap.set("n", "<C-w>j", "5<C-w>-")
-- H and L to move to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- TODO: fix C-Space to bring up the completion menu
vim.keymap.set({ "n", "i" }, "<C-Space>", "<nop>")

-- TODO: find a new key for recording macros
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

-- vim options
vim.opt.scrolloff = 8
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.cursorline = true

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- automatically set indents to 2 if the file is a react file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "javascript.jsx", "typescriptreact", "typescript.tsx" },
    callback = function()
        vim.api.nvim_command("set tabstop=2")
        vim.api.nvim_command("set shiftwidth=2")
        vim.api.nvim_out_write("detected filetype, set indent to 2\n")
    end
})

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
vim.cmd("colorscheme onehalfdark")

-- lsp setup using lsp-zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")
    vim.keymap.set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")
    vim.keymap.set("n", "gd", ":lua=vim.lsp.buf.definition()<CR>")
    vim.keymap.set("n", "gD", ":lua=vim.lsp.buf.declaration()<CR>")
    vim.keymap.set("n", "gr", ":lua=vim.lsp.buf.references()<CR>")
    vim.keymap.set("n", "gi", ":lua=vim.lsp.buf.implementation()<CR>")
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
