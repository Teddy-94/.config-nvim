-- [KEYMAPS]

-- C-s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- C-l to clear any highlights
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
vim.keymap.set("n", "<C-t>", ":bel new<CR>:term<CR>a")
-- map esc to get into normal mode when in a term buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Shift j and k moves visual seleciton down and up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- H and L to move to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Tab and Shift-tab to cycle through selections in the popup menu
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Navigating between windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Creating splits
vim.keymap.set("n", "<leader>ws", ":split<CR><C-w>j")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR><C-w>l")

-- Window resizing
vim.keymap.set("n", "<C-w>l", "5<C-w>>")
vim.keymap.set("n", "<C-w>h", "5<C-w><")
vim.keymap.set("n", "<C-w>k", "5<C-w>+")
vim.keymap.set("n", "<C-w>j", "5<C-w>-")

-- LSP keymaps
vim.keymap.set('n', '<leader>t', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "K", ":lua=vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<C-k>", ":lua=vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")

-- Alt-Shift-f to format the buffer using lsp
vim.keymap.set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")

-- Telescope LSP keymaps
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR><Esc>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR><Esc>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementation<CR><Esc>")

-- Telescope file browser keymaps
vim.keymap.set("n", "<Leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR><esc>",
    { desc = "open file browser with current file showing" })
vim.keymap.set("n", "<Leader>E", ":Telescope file_browser<CR><esc>", { desc = "toggle file browser" })

-- Telescope find / grep keymaps
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find git_files" })
vim.keymap.set("n", "<Leader>gg", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Grep" })
