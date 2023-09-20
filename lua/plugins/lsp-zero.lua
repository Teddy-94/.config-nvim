return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")
                vim.keymap.set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")
                vim.keymap.set("n", "gd", ":lua=vim.lsp.buf.definition()<CR>")
                vim.keymap.set("n", "gD", ":lua=vim.lsp.buf.declaration()<CR>")
                vim.keymap.set("n", "gr", ":lua=vim.lsp.buf.references()<CR>")
                vim.keymap.set("n", "gi", ":lua=vim.lsp.buf.implementation()<CR>")
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
        end
    },
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp_zero = require("lsp-zero")
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup()
                }
            })
        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping({
                        -- if nothing is selected inserts newline
                        -- if something has been selected, insert the completion
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                })
            })
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },

}
