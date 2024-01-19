-- C-space gets mapped in cmp to bring up completion menu
vim.keymap.set({ "n", "i" }, "<C-space>", "<nop>")

-- TODO: find a new key for recording macros
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", "q")
vim.keymap.set("n", "<leader>Q", "Q")

-- Visuals
vim.opt.scrolloff = 6
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
-- Dont overwrite clipboard when pasting in visual mode
vim.keymap.set({ "x", "v" }, "p", "P")

-- Dont move the cursor when yanking in visual mode
vim.keymap.set({ "x", "v" }, "y", "ygv<esc>")

-- Keep cursor in the middle when using J, C-d, C-u, and search
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "p", "pzz")

vim.opt.wrap = false
-- This lets j and k navigate over wrapped lines as if they were real lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- automatically set indents to 2 if the file is a react file
vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua', 'jsx', 'tsx', 'typescriptreact', 'javascriptreact' },
  callback = function()
        vim.api.nvim_command("setlocal tabstop=2")
        vim.api.nvim_command("setlocal shiftwidth=2")
        vim.api.nvim_out_write("detected filetype, set indent to 2")
    end
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect"

vim.opt.incsearch = true

vim.opt.shortmess = "aFI"
vim.opt.swapfile = false
vim.opt.backup = false
