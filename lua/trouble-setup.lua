vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup({
  auto_preview = false,
  keys = { ["<cr>"] = "jump_close" },
})
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle diagnostics list" })
