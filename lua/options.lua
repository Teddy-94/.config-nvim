-- [OPTIONS]
-- Here lives the settings related to core vim options and behaviour

-- Disable these keys
-- C-space gets mapped in cmp to bring up completion menu
vim.keymap.set({ "n", "i" }, "<C-Space>", "<nop>")

-- TODO: find a new key for recording macros
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

-- Visuals
vim.opt.scrolloff = 8
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

-- Keep cursor in the middle when using J, C-d or C-u
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.opt.wrap = true
-- This lets j and k navigate over wrapped lines as if they were real lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- automatically set indents to 2 if the file is a react file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "javascript.jsx", "typescriptreact", "typescript.tsx" },
    callback = function()
        vim.api.nvim_command("set tabstop=2")
        vim.api.nvim_command("set shiftwidth=2")
        vim.api.nvim_out_write("detected filetype, set indent to 2\n")
    end
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false