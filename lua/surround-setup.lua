vim.pack.add({ "https://github.com/nvim-mini/mini.surround" })
require("mini.surround").setup({
  opts = {
    mappings = {
      add = "sa",
      replace = "sr",
      delete = "",
      find = "",
      find_left = "",
      highlight = "",
      update_n_lines = "",
      suffix_last = "",
      suffix_next = "",
    },
    respect_selection_type = true
  }
})
