return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
    })

    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>a", mark.add_file)
  end,
}
