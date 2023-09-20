return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.api.nvim_command, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' }, -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' }, -- Required
    },
    config = function()
        -- lsp setup using lsp-zero
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })

            vim.keymap.set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")
            vim.keymap.set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")
            vim.keymap.set("n", "gd", ":lua=vim.lsp.buf.definition()<CR>")
            vim.keymap.set("n", "gD", ":lua=vim.lsp.buf.declaration()<CR>")
            vim.keymap.set("n", "gr", ":lua=vim.lsp.buf.references()<CR>")
            vim.keymap.set("n", "gi", ":lua=vim.lsp.buf.implementation()<CR>")
        end)

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end
}
