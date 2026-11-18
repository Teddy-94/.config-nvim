vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })
require("nvim-tree").setup({
  actions = { open_file = { quit_on_open = true } },
  view = { width = 60 },
  diagnostics = { enable = true },
  filters = { git_ignored = false },
  renderer = {
    highlight_bookmarks = "all",
    special_files = {},
    indent_markers = { enable = true },
    icons = {
      git_placement = "signcolumn",
      show = { file = false, folder = false, folder_arrow = false, modified = false, bookmarks = false },
      glyphs = {
        git = { unstaged = "U", staged = "S", unmerged = "UM", renamed = "R", untracked = "UT", deleted = "D", ignored = "i" },
      },
    },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>")
