local set = vim.keymap.set
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup {
      defaults = {
        wrap_results = false,
        layout_strategy = 'vertical',
        layout_config = { vertical = { width = { padding = 1 } } },
        initial_mode = "normal",
        path_display = function(_, path)
          return string.format("%s | ", path)
        end,
      },
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.wo.number = true
      end
    })

    set("n", "<Leader>ff", ":Telescope find_files<CR>i", { desc = "Find files" })
    set("n", "<Leader>fF", ":Telescope git_files<CR>i", { desc = "Find git_files" })
    set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>i", { desc = "Current buffer fuzzy find" })
    set({ "n", "x" }, "<Leader>fg", "<cmd>lua=require('telescope.builtin').grep_string({disable_coordinates = true})<CR>i", { desc = "Ripgrep" })
    set("n", "<Leader>gs", ":Telescope git_status<CR>", { desc = "Telescope git status" })
    set("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
    set("n", "<Leader>T", ":Telescope<CR>", { desc = "Telescope" })
    set("n", "<Leader>fh", ":Telescope help_tags<CR>i", { desc = "Telescope Search Help" })
  end
}
