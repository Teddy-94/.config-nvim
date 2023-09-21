-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Misc. commands
-- C-s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")
-- C-l to clear any highlights
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- Open a terminal buffer in the current dir and puts you in edit
vim.keymap.set("n", "<C-t>", ":bel new<CR>:term<CR>a")
-- map esc to get into normal mode when in a term buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--paste no overwrite what you have in register
vim.keymap.set({ "x", "v" }, "p", "P")

-- navigate window panes
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")

-- make window resizing easier
vim.keymap.set("n", "<C-w>l", "5<C-w>>")
vim.keymap.set("n", "<C-w>h", "5<C-w><")
vim.keymap.set("n", "<C-w>k", "5<C-w>+")
vim.keymap.set("n", "<C-w>j", "5<C-w>-")
-- H and L to move to start and end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- C-space gets mapped in cmp to bring up completion menu
vim.keymap.set({ "n", "i" }, "<C-Space>", "<nop>")

-- TODO: find a new key for recording macros
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

-- vim options
vim.opt.scrolloff = 8
vim.opt.nu = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = true

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.opt.cursorline = true

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

-- automatically set indents to 2 if the file is a react file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "javascript.jsx", "typescriptreact", "typescript.tsx" },
    callback = function()
        vim.api.nvim_command("set tabstop=2")
        vim.api.nvim_command("set shiftwidth=2")
        vim.api.nvim_out_write("detected filetype, set indent to 2\n")
    end
})

vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false

-- uses lazy.nvim https://github.com/folke/lazy.nvim
-- :help lazy.nvim.txt` for more info
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
require("lazy").setup("plugins", { defaults = { lazy = false } })


-- [[ Set Colorscheme ]]
-- vim.cmd([[colorscheme onehalfdark]])
-- vim.cmd([[colorscheme rose-pine]])
vim.cmd([[colorscheme gruvbox]])
--vim.cmd([[colorscheme catppuccin]])


-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)
    -- do stuff on LSP attatch
end
vim.keymap.set('n', '<leader>t', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "K", ":lua=vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<C-k>", ":lua=vim.lsp.buf.signature_help()<CR>")

vim.keymap.set("n", "<A-S-f>", ":lua=vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<leader>a", ":lua=vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR><Esc>")
vim.keymap.set("n", "gD", ":Telescope lsp_declaration<CR><Esc>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR><Esc>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementation<CR><Esc>")

local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim' } }
        },
    },
    pyright = {},
    tsserver = {},
    html = { filetypes = { 'html' } },
    cssls = {},
    tailwindcss = {},
}

require('mini.completion').setup({})
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}
