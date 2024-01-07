return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      view = {
        width = 60
      },
      diagnostics = {
        enable = true
      },
      modified = {
        enable = true
      },
      filters = {
        git_ignored = false
      },
      renderer = {
        highlight_bookmarks = "all",
        special_files = {},
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
        },
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
      },
    }

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>")
  end
}
