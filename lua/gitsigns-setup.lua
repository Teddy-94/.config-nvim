require("gitsigns").setup {
  current_line_blame = true, current_line_blame_opts = { delay = 500 },
}

vim.keymap.set("n", "<Leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Git diff this file" })
vim.keymap.set("n", "<Leader>gwd", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "Git show word diff" })
vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git toggle blame" })