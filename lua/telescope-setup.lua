require("telescope").setup {
  defaults = {
    wrap_results = true,
    path_display = { "absolute" },
    initial_mode = "normal",
  },
  pickers = {
    find_files = { theme = "ivy", },
    git_files = { theme = "ivy", },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = false,
      mappings = {
        ["n"] = {
          ["a"] = require "telescope".extensions.file_browser.actions.create,
        }
      }
    }
  }
}

require('telescope').load_extension("ui-select")
require('telescope').load_extension("file_browser")


-- Telescope LSP keymaps
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementation<CR>")

-- Telescope file browser keymaps
-- set("n", "<Leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR><Esc>",
--     { desc = "open file browser at current file" })
-- set("n", "<Leader>E", ":Telescope file_browser<CR>", { desc = "toggle file browser" })

-- Telescope find / grep keymaps
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>i", { desc = "Find files" })
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope git_files<CR>i", { desc = "Find git_files" })
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope current_buffer_fuzzy_find<CR>i", { desc = "Current buffer grep" })
vim.keymap.set("n", "<Leader>fG", "<cmd>Telescope grep_string<CR>i", { desc = "Ripgrep" })
vim.keymap.set("n", "<Leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })

-- Telescope search help files
vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>i", { desc = "Telescope Search Help" })
