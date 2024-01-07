return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      current_line_blame = true,
      on_attach = function()
        local gs = package.loaded.gitsigns

        vim.api.nvim_create_user_command('Diff', function()
          gs.diffthis()
        end, {})

        vim.api.nvim_create_user_command('Wdiff', function()
          gs.toggle_word_diff()
        end, {})

        vim.api.nvim_create_user_command('Blame', function()
          gs.toggle_current_line_blame()
        end, {})
      end
    }
  end
}
