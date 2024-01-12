return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      notification = {
        override_vim_notify = true,
        window = {
          normal_hl = "",
          winblend = 50,
          border = "none"
        },
      },
    })
  end
}
