local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
end

return {
  { 'williamboman/mason.nvim', config = true },
  { 'neovim/nvim-lspconfig' },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "jdtls",
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
        ["tsserver"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tsserver.setup {}
        end,
        ["rust_analyzer"] = function()
          require("rust-tools").setup {}
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
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
            init_options = {
              ["symfony.enabled"] = true,
              ["language_server_phpstan.enabled"] = true,
              ["language_server_phpstan.bin"] = "/Users/teodor.adolfsson/.local/share/nvim/mason/packages/phpstan"
            }
          })
        end
      }
    },
  },
}
