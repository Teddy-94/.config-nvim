return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      current_line_blame = true,
      on_attach = function()
        local gs = require('gitsigns')
        vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "diffthis", silent = true })
        vim.keymap.set("n", "<leader>hD", function () gs.diffthis('origin/main') end, { desc = "diffthis origin/main" })
        vim.keymap.set("n", "<leader>hw", gs.toggle_word_diff, { desc = "toggle_word_diff" })
        vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "toggle blame" })
      end
    }
  end
}
