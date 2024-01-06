return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vimdoc", "tsx", "javascript", "typescript", "php", "lua", "python", "json", "graphql", "yaml"
      },
      highlight = {
        enable = true
      },
      auto_install = true
    })
  end
}
