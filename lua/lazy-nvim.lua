-- Bootsrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  defaults = {
    lazy = false,
  },
  spec = {
    -- make it look pretty
    { import = "plugins/colors" },
    -- { import = "plugins/lualine" },
    { import = "plugins/fidget" },
    { import = "plugins/treesitter" },

    -- lsp and autocomplete
    { import = "lsp-setup" },
    { import = "plugins/nvim-cmp" },

    -- find and browse files
    { import = "plugins/telescope" },
    { import = "plugins/nvim-tree" },
    { import = "plugins/harpoon" },

    -- utils
    { import = "plugins/gitsigns" },
    { import = "plugins/neogit" },
    { import = "plugins/trouble" },
    { import = "plugins/surround" },
    { import = "plugins/comment" },
    { "folke/which-key.nvim",       opts = {} },
    {
      "mbbill/undotree",
      config = function()
        vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>")
      end
    },
    { "github/copilot.vim" },
    { import = "plugins/oil" },
  },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  change_detection = {
    enabled = true,
    notify = true, -- get a notification when changes are found
  }
})
