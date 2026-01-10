vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup {
  action_keys = {
    jump = {},
    jump_close = { "<CR>" }
  },
  auto_preview = false,
  signs = {
    error = "E",
    warning = "W",
    hint = "H",
    information = "I"
  },
  use_diagnostic_signs = false
}
vim.keymap.set('n', '<leader>t', ":Trouble diagnostics toggle<CR>", { desc = 'Toggle diagnostics list' })
