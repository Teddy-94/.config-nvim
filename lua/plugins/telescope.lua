local function asf()

end

asf()
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
        path_display = { smart = true },
      },
      pickers = {
        -- Search
        find_files = {
          initial_mode = "insert",
        },
        git_files = {
          initial_mode = "insert"
        },
        current_buffer_fuzzy_find = {
          initial_mode = "insert"
        },
        live_grep = {
          initial_mode = "insert",
        },
        grep_string = {
          initial_mode = "insert",
          disable_coordinates = true,
          only_sort_text = true
        },
        help_tags = {
          initial_mode = "insert"
        },
        man_pages = {
          initial_mode = "insert"
        },
        git_status = {
          initial_mode = "normal"
        },
        buffers = {
          initial_mode = "normal"
        },
        -- LSP
        lsp_references = {
          initial_mode = "normal",
          include_declaration = false,
          fname_width = 60,
          trim_text = true
        },
        lsp_definitions = {
          initial_mode = "normal"
          },
        lsp_implementations = {
          initial_mode = "normal"
        },
      }
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.wo.number = true
      end
    })

    local set = vim.keymap.set
    local tb = require('telescope.builtin')
    set("n", "<Leader>ff", tb.find_files, { desc = "Find files" })
    set("n", "<Leader>fF", tb.git_files, { desc = "Find git_files" })
    set("n", "<Leader>fo", tb.oldfiles, { desc = "Find recently opened files" })
    set("n", "<leader>/", tb.live_grep, { desc = "Live grep" })
    set({ "n", "x" }, "<Leader>fg", tb.grep_string, { desc = "Ripgrep" })
    set("n", "<Leader>fh", tb.help_tags, { desc = "Telescope Search Help" })
    set("n", "<Leader>fm", tb.man_pages, { desc = "Telescope Search Manual" })

    set("n", "<Leader>gs", tb.git_status, { desc = "Telescope git status" })
    set("n", "<Leader>fb", tb.buffers, { desc = "Telescope buffers" })
    set("n", "<Leader>T", ":Telescope<CR>", { desc = "Telescope" })

    set("n", "gd", tb.lsp_definitions, { desc = "go to definition" })
    set("n", "gr", tb.lsp_references, { desc = "go to references" })
    set("n", "gi", tb.lsp_implementations, { desc = "go to implementation" })
  end
}
