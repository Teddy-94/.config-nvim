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
  -- If a plugin requires setup etc, it goes in a separate file, that file is then imported here which tells Lazy.nvim to install it.
  { import = "plugins/colors" },
  { import = "lsp-setup" },
  { import = "plugins/nvim-cmp-setup" },
  { import = "plugins/telescope-setup" },
  { import = "plugins/gitsigns-setup" },
  { import = "plugins/lualine-setup" },
  { import = "plugins/nvim-tree-setup" },
  { import = "plugins/trouble-nvim-setup" },
  { import = "plugins/nvim-treesitter-setup" },
  { "echasnovski/mini.surround",  opts = {} },
  { "folke/which-key.nvim",       opts = {} },
  { "numToStr/Comment.nvim",      opts = {} },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u",
        ":UndotreeToggle<CR>:UndotreeFocus<CR>")
    end
  },
})
