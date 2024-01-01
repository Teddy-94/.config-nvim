require("nvim-tree").setup {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    width = 60
  },
  renderer = {
    icons = {
      git_placement = "signcolumn",
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "U",
          staged = "S",
          unmerged = "UM",
          renamed = "R",
          untracked = "UT",
          deleted = "D",
          ignored = "i",
        },
      },
    }
  }
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>")