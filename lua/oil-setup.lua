vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require('oil').setup({
  use_default_keymaps = false,
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-p>"] = "actions.preview",
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    padding= 1,
    border = "rounded",
    preview_split = "right",
  },
})
vim.keymap.set("n", "<leader>oi", function() require('oil').open_float() end)
