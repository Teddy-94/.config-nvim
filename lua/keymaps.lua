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

-- H and L to move to start and end of line
set("n", "H", "^")
set("n", "L", "$")

-- Tab and Shift-tab to cycle through selections in the popup menu
set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Navigating between windows
set("n", "<leader>wh", "<C-w>h")
set("n", "<leader>wj", "<C-w>j")
set("n", "<leader>wk", "<C-w>k")
set("n", "<leader>wl", "<C-w>l")

-- Creating and moving splits
set("n", "<leader>ws", ":split<CR><C-w>j")
set("n", "<leader>wv", ":vsplit<CR><C-w>l")
set("n", "<leader>wH", "<C-w>H", { desc = "Move split left" })
set("n", "<leader>wJ", "<C-w>J", { desc = "Move split down" })

-- Window resizing
set("n", "<C-w>l", "5<C-w>>")
set("n", "<C-w>h", "5<C-w><")
set("n", "<C-w>k", "5<C-w>+")
set("n", "<C-w>j", "5<C-w>-")

-- LSP keymaps
set("n", "K", ":lua=vim.lsp.buf.hover()<CR>")
set("n", "<C-k>", ":lua=vim.lsp.buf.signature_help()<CR>")
set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")

-- Alt-Shift-f to format the buffer using lsp
set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")

-- Telescope LSP keymaps
set('n', '<leader>t', ":Telescope diagnostics<CR><Esc>", { desc = 'Open diagnostics list' })
set("n", "gd", ":Telescope lsp_definitions<CR><Esc>")
set("n", "gr", ":Telescope lsp_references<CR><Esc>")
set("n", "gi", ":Telescope lsp_implementation<CR><Esc>")

-- Telescope file browser keymaps
set("n", "<Leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR><Esc>",
    { desc = "open file browser at current file" })
set("n", "<Leader>E", ":Telescope file_browser<CR><Esc>", { desc = "toggle file browser" })

-- Telescope find / grep keymaps
set("n", "<Leader>ff", "<cmd>Telescope find_files<CR><Esc>", { desc = "Find files" })
set("n", "<Leader>fg", "<cmd>Telescope git_files<CR><Esc>", { desc = "Find git_files" })
set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Current buffer grep" })
set("n", "<Leader>G", "<cmd>Telescope grep_string<CR>", { desc = "Ripgrep" })
set("n", "<Leader>gs", "<cmd>Telescope git_status<CR><Esc>", { desc = "Telescope git status" })

-- Telescope search help files
set("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Search Help" })
