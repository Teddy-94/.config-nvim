return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup({
      view_options = {
        show_hidden = true,
      }
    })
    vim.keymap.set("n", "<leader>oi", function() require('oil').open_float() end)
  end,
}
