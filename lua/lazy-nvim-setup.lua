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
  -- make it look pretty
  { import = "plugins/colors" },
  { import = "plugins/lualine" },
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
  { import = "plugins/trouble" },
  { "echasnovski/mini.surround",  opts = {} },
  { "folke/which-key.nvim",       opts = {} },
  {
    "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
        vim.keymap.set("n", "<C-/>", "gcc", {remap = true})
        vim.keymap.set("v", "<C-/>", "gc", {remap = true})
      end
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u",
        ":UndotreeToggle<CR>:UndotreeFocus<CR>")
    end
  },
})
