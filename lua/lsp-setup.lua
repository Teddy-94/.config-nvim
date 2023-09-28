return {
    { 'williamboman/mason.nvim', config = true },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "pylsp",
                "tsserver",
                "eslint",
                "html",
                "cssls",
                "tailwindcss",
                "jdtls",
                "jsonls",
            },
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide targeted overrides for specific servers.
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
                            ["php_code_sniffer.enabled"] = true,
                            ["php_code_sniffer.bin"] = "/home/teddy/.local/share/nvim/mason/bin/phpcs",
                            ["language_server_php_cs_fixer.enabled"] = true,
                            ["language_server_php_cs_fixer.bin"] = "/home/teddy/.local/share/nvim/mason/bin/php-cs-fixer",
                        }
                    })
                end
            }
        },
    },
}
