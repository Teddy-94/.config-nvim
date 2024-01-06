return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = false,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    })
    vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine
  end
}
