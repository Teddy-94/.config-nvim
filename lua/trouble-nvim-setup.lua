return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup {
      action_keys = {
        jump = {},
        jump_close = { "<CR>" }
      },
      auto_preview = false,
      icons = false,
      signs = {
        error = "E",
        warning = "W",
        hint = "H",
        information = "I"
      },
      use_diagnostic_signs = false
    }
    vim.keymap.set('n', '<leader>t', ":TroubleToggle<CR>", { desc = 'Toggle diagnostics list' })
  end
}
