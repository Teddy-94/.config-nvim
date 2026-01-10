vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require('lualine').setup({
  options = {
    icons_enabled = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'diagnostics' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
})
vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine
