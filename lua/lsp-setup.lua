local on_attach = function()
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
  vim.keymap.set({ "n", "i" }, "<C-k>", function() vim.lsp.buf.signature_help() end)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end)
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "jsonls",
        "phpactor",
        "graphql"
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capbilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = on_attach
          }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
        ["phpactor"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.phpactor.setup({
            on_attach = on_attach,
            init_options = {
              ["symfony.enabled"] = true,
              ["language_server_phpstan.enabled"] = true,
              ["language_server_phpstan.bin"] = "/Users/teodor.adolfsson/.local/share/nvim/mason/packages/phpstan"
            }
          })
        end
      }
    })
  end
}
