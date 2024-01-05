return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
      }
    })
    vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine
  end
}
