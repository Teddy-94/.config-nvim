return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      current_line_blame = false,
      on_attach = function()
        local gs = require('gitsigns')
        vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "diffthis", silent = true })
        vim.keymap.set("n", "<leader>hD", function () gs.diffthis('origin/main') end, { desc = "diffthis origin/main" })
        vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Gitsigns blame line" })

        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
        vim.keymap.set("n", "<leader>hn", gs.next_hunk, { desc = "Gitsigns next hunk" })
        vim.keymap.set("n", "<leader>hN", gs.prev_hunk, { desc = "Gitsigns previous hunk" })

        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Gitsigns stage hunk" })
        vim.keymap.set("n", "<leader>hi", gs.undo_stage_hunk, { desc = "Gitsigns undo_stage_hunk" })
      end
    }
  end
}
