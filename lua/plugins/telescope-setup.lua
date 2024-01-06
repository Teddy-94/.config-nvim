return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup {
      defaults = {
        wrap_results = true,
        path_display = { "absolute" },
        layout_strategy = 'vertical',
        layout_config = { vertical = { width = { padding = 1 } } },
        initial_mode = "normal"
      },
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.wo.number = true
      end
    })

    -- Telescope find / grep keymaps
    vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>i", { desc = "Find files" })
    vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope git_files<CR>i", { desc = "Find git_files" })
    vim.keymap.set("n", "<leader>fF", "<cmd>Telescope current_buffer_fuzzy_find<CR>i", { desc = "Current buffer grep" })
    vim.keymap.set({ "n", "x" }, "<Leader>fG", "<cmd>Telescope grep_string<CR>i", { desc = "Ripgrep" })
    vim.keymap.set("n", "<Leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })

    -- Telescope search help files
    vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>i", { desc = "Telescope Search Help" })
  end
}
