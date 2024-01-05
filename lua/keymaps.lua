-- [KEYMAPS]
local set = vim.keymap.set
-- C-s to save
set("n", "<C-s>", ":w<CR>")

-- C-l to clear any highlights
set("n", "<C-l>", ":noh<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
set("n", "<C-t>", ":bel new<CR>:term<CR>a")
-- map esc to get into normal mode when in a term buffer
set("t", "<Esc>", "<C-\\><C-n>")

-- Shift j and k moves visual seleciton down and up
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep highlight when indenting
set("v", ">", ">gv")
set("v", "<", "<gv")

-- H and L to move to start and end of line and m to %
set({'n', 'x'}, "H", "^")
set({'n', 'x'}, "L", "$")

-- Tab and Shift-tab to cycle through selections in the popup menu
set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Navigating between windows
set("n", "<leader>wh", "<C-w>h")
set("n", "<leader>wj", "<C-w>j")
set("n", "<leader>wk", "<C-w>k")
set("n", "<leader>wl", "<C-w>l")

-- Creating and moving splits
set("n", "<leader>ws", ":split<CR><C-w>j", { desc = "Split Horizontally" })
set("n", "<leader>wv", ":vsplit<CR><C-w>l", { desc = "Split Vertically" })
set("n", "<leader>wH", "<C-w>H", { desc = "Move split left" })
set("n", "<leader>wJ", "<C-w>J", { desc = "Move split down" })

-- Window resizing
set("n", "<C-w>l", "5<C-w>>")
set("n", "<C-w>h", "5<C-w><")
set("n", "<C-w>k", "5<C-w>+")
set("n", "<C-w>j", "5<C-w>-")

-- LSP keymaps
set("n", "K", ":lua=vim.lsp.buf.hover()<CR>")
set("n", "<leader>rn", ":lua=vim.lsp.buf.rename()<CR>", { desc = 'Lsp rename' })
set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>", { desc = 'Lsp code actions' })

set("n", "<leader>fmt", ":lua=vim.lsp.buf.format()<CR>", { desc = 'Lsp buf format' })

set('n', '<leader>t', ":TroubleToggle<CR>", { desc = 'Toggle diagnostics list' })
