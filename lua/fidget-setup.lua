vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
require("fidget").setup({
  notification = {
    override_vim_notify = true,
    window = {
      normal_hl = "",
      winblend = 50,
      border = "none",
      avoid = { "NvimTree" }
    },
  },
})
