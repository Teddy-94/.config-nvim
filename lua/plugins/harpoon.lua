return {
  {
    "thePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) end
  }
}
