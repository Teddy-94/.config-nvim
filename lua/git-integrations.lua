vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
})

require("diffview").setup({ use_icons = false })
vim.keymap.set("n", "<leader>H", function()
  if require("diffview.lib").get_current_view() then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end, { desc = "Toggle Diffview" })

require("gitsigns").setup({
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("<leader>hd", gs.diffthis, "Gitsigns diffthis")
    map("<leader>hD", function() gs.diffthis("~") end, "Gitsigns diffthis against last commit")
    map("<leader>hb", gs.blame_line, "Gitsigns blame line")

    map("<leader>hn", function() gs.nav_hunk("next") end, "Gitsigns next hunk")
    map("<leader>hp", function() gs.nav_hunk("prev") end, "Gitsigns previous hunk")

    map("<leader>hP", gs.preview_hunk, "Gitsigns preview hunk")
    map("<leader>hs", gs.stage_hunk, "Gitsigns stage or unstage hunk")
  end
})
