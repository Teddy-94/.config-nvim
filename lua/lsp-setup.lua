vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

-- "o" pulls from the LSP omnifunc so the native autocomplete menu shows LSP items as you type
vim.o.autocomplete = true
vim.o.complete = "o,.^5"
vim.o.completeopt = "menuone,noselect,popup,fuzzy"

-- Enter accepts the selected item, or the first one if nothing is selected yet
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 0 then
    return "<CR>"
  end
  return vim.fn.complete_info({ "selected" }).selected == -1 and "<C-n><C-y>" or "<C-y>"
end, { expr = true })

vim.keymap.set("i", "<C-y>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<C-x><C-o>"
end, { expr = true, desc = "Accept or trigger completion" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      -- Needed so accepting an item expands snippets and applies extra edits like auto-imports
      vim.lsp.completion.enable(true, client.id, args.buf)
    end

    local opts = { buffer = args.buf }
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, { buffer = args.buf, desc = "Format buffer" })
  end,
})

-- LSP progress isn't wired into Neovim's progress messages by default; forwarding it
-- makes it show in the default statusline. progress is dropped from the cmdline to keep it quiet.
vim.opt.messagesopt = "hit-enter,history:500,progress:"
-- The default statusline only reads progress once vim.ui is loaded, and tracking starts on the first call
vim.ui.progress_status()
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    local value = ev.data.params.value
    vim.api.nvim_echo({ { value.message or "done" } }, false, {
      id = "lsp." .. ev.data.params.token,
      kind = "progress",
      source = "vim.lsp",
      title = value.title,
      status = value.kind ~= "end" and "running" or "success",
      percent = value.percentage,
    })
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

vim.lsp.config("oxlint", {
  cmd = { "oxlint", "--lsp" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local git_dir = vim.fs.find(".git", { path = fname, upward = true })[1]
    if git_dir then
      on_dir(vim.fs.dirname(git_dir))
    end
  end,
})

vim.lsp.config("oxfmt", {
  cmd = { "oxfmt", "--lsp" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { ".oxfmtrc.json", "package.json", ".git" },
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

