-- Cache compiled Lua modules so plugins load faster on startup
vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shortmess:append("aI")
vim.opt.swapfile = false
vim.opt.backup = false

-- Prevent accidentally crashing buffers when input language is set to Swedish
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
vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ruler = false
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
-- Don't overwrite clipboard when pasting in visual mode
vim.keymap.set("x", "p", "P")

-- Don't move the cursor when yanking in visual mode
vim.keymap.set("x", "y", "ygv<esc>")

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

-- C-s to save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<D-s>", "<cmd>w<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
vim.keymap.set("n", "<C-t>", "<cmd>bel split | terminal<CR>i")
-- map esc to get into normal mode when in a term buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Shift j and k moves visual selection down and up
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")

-- Keep highlight when indenting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- H and L to move to start and end of line
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "$")

-- Navigating between windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Creating and moving splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move split left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move split down" })

-- Window resizing
vim.keymap.set("n", "<C-w>l", "5<C-w>>")
vim.keymap.set("n", "<C-w>h", "5<C-w><")
vim.keymap.set("n", "<C-w>k", "5<C-w>+")
vim.keymap.set("n", "<C-w>j", "5<C-w>-")

-- Comment lines
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<leader>c", "gcgv", { remap = true, desc = "Toggle comment" })

-- Diagnostics list in quickfix
vim.keymap.set("n", "<leader>t", function()
  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    vim.cmd.cclose()
  else
    vim.diagnostic.setqflist()
  end
end, { desc = "Toggle diagnostics list" })

-- Plugins
vim.pack.add({ "https://github.com/teddy-94/kanagawa.nvim" })
require("kanagawa").setup({
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
require("git-integrations")
require("fzf-setup")
require("nvim-tree-setup")
require("oil-setup")
require("surround-setup")
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>", { desc = "Toggle undotree" })
