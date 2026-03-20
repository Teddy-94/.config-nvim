vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
})

local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-y>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "buffer" },
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.general = capabilities.general or {}
capabilities.general.positionEncodings = { 'utf-16' }

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

vim.lsp.config('oxlint', {
  cmd = { 'oxlint', '--lsp' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local git_dir = vim.fs.find('.git', { path = fname, upward = true })[1]
    if git_dir then
      on_dir(vim.fs.dirname(git_dir))
    end
  end,
})

vim.lsp.config('oxfmt', {
  cmd = { 'oxfmt', '--lsp' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_markers = { '.oxfmtrc.json', 'package.json', '.git' },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "yamlls",
    "tsgo",
    "oxlint",
    "oxfmt",
  },
})

vim.lsp.enable('oxfmt')

