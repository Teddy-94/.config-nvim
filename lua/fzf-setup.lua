vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })
local fzf = require("fzf-lua")
fzf.setup({
  defaults = { file_icons = false },
  winopts = {
    width = 0.95,
    height = 0.95,
    preview = { layout = "vertical" },
  },
  lsp = { includeDeclaration = false },
})

local set = vim.keymap.set
set("n", "<leader>ff", fzf.files, { desc = "Find files" })
set("n", "<leader>fF", fzf.git_files, { desc = "Find git files" })
set("n", "<leader>fo", fzf.oldfiles, { desc = "Find recently opened files" })
set("n", "<leader>/", fzf.live_grep, { desc = "Live grep" })
set("n", "<C-f>", fzf.live_grep, { desc = "Live grep" })
set("n", "<leader>fg", fzf.grep_cword, { desc = "Grep word under cursor" })
set("x", "<leader>fg", fzf.grep_visual, { desc = "Grep selection" })
set("n", "<leader>fh", fzf.helptags, { desc = "Search help" })
set("n", "<leader>fm", fzf.manpages, { desc = "Search man pages" })

set("n", "<leader>T", fzf.builtin, { desc = "All fzf-lua pickers" })

set("n", "gd", fzf.lsp_definitions, { desc = "Go to definition" })
set("n", "gr", fzf.lsp_references, { desc = "Go to references" })
set("n", "gi", fzf.lsp_implementations, { desc = "Go to implementation" })
