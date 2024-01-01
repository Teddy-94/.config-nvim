require("lualine").setup {
  {
    globalstatus = true,
  }
}

vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine
