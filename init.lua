vim.g.mapleader = " "
vim.g.maplocalleader = ' '

vim.opt.shortmess = "aFI"
vim.opt.swapfile = false
vim.opt.backup = false
--
-- C-space gets mapped in cmp to bring up completion menu
vim.keymap.set({ "n", "i" }, "<C-space>", "<nop>")
-- Prevent accidentaly crashing buffers when input language is set to Swedish
vim.keymap.set({ "n", "i" }, "Ö", "<nop>")

-- TODO: find a new key for recording macros
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", "q")
vim.keymap.set("n", "<leader>Q", "Q")

vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 10
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
-- Dont overwrite clipboard when pasting in visual mode
vim.keymap.set({ "x", "v" }, "p", "P")

-- Dont move the cursor when yanking in visual mode
vim.keymap.set({ "x", "v" }, "y", "ygv<esc>")

-- Keep cursor in the middle when using J, C-d, C-u, and search
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.opt.wrap = false
-- This lets j and k navigate over wrapped lines as if they were real lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect"

-- C-s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<D-s>", ":w<CR>")

-- C-l to clear any highlights
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
vim.keymap.set("n", "<C-t>", ":bel new<CR>:term<CR>a")
-- map esc to get into normal mode when in a term buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Shift j and k moves visual seleciton down and up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep highlight when indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- H and L to move to start and end of line and m to %
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "$")

-- Tab and Shift-tab to cycle through selections in the popup menu
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Navigating between windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Creating and moving splits
vim.keymap.set("n", "<leader>ws", ":split<CR><C-w>j", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR><C-w>l", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move split left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move split down" })

-- Window resizing
vim.keymap.set("n", "<C-w>l", "5<C-w>>")
vim.keymap.set("n", "<C-w>h", "5<C-w><")
vim.keymap.set("n", "<C-w>k", "5<C-w>+")
vim.keymap.set("n", "<C-w>j", "5<C-w>-")

vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, { desc = "vim.lsp.buf.code_action()" })
vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.format() end, { desc = "vim.lsp.buf.format()" })
-- vim.keymap.set("n", "<leader>t", function () vim.diagnostic.open_float() end, { desc = "open diagnostics float" })

-- Plugins
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim", })
vim.pack.add({ "https://github.com/Mofiqul/vscode.nvim", })
vim.pack.add({ "https://github.com/rose-pine/neovim", })
require("rose-pine").setup({
  variant = 'moon',      -- 'auto'|'main'|'moon'|'dawn'
  dark_variant = 'moon', --  'main'|'moon'|'dawn'
  disable_italics = true,
  disable_background = vim.g.transparent_enabled,
  disable_float_background = vim.g.transparent_enabled,
})
vim.pack.add({ "https://github.com/teddy-94/kanagawa.nvim" })
require 'kanagawa'.setup({
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  typeStyle = {},
  transparent = vim.g.transparent_enabled,
  theme = "wave",
})
vim.cmd("colorscheme kanagawa")
require("lsp-setup")

require("telescope-setup")
require("lualine-setup")
require("fidget-setup")
require("nvim-tree-setup")

require("surround-setup")
require("comment-nvim-setup")
require("oil-setup")
require("trouble-setup")
require("git-integrations")
vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
vim.pack.add({ "https://github.com/mbbill/undotree" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>")
