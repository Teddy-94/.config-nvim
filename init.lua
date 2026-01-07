vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
})

require("options")
require("keymaps")
require("lsp-setup")
require("telescope-setup")
require("nvim-tree-setup")
require("colors")

-- git stuff
vim.pack.add({
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/sindrets/diffview.nvim",
})
require("neogit").setup({
  vim.keymap.set("n", "<leader>H", ":Neogit<CR>", { desc = "Neogit" })
})

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup {
  current_line_blame = false,
  on_attach = function()
    local gs = require('gitsigns')
    vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "diffthis", silent = true })
    vim.keymap.set("n", "<leader>hD", function() gs.diffthis('origin/main') end, { desc = "diffthis origin/main" })
    vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Gitsigns blame line" })

    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
    vim.keymap.set("n", "<leader>hn", gs.next_hunk, { desc = "Gitsigns next hunk" })
    vim.keymap.set("n", "<leader>hN", gs.prev_hunk, { desc = "Gitsigns previous hunk" })

    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Gitsigns stage hunk" })
    vim.keymap.set("n", "<leader>hi", gs.undo_stage_hunk, { desc = "Gitsigns undo_stage_hunk" })
  end
}

-- UI stuff
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require('lualine').setup({
  options = {
    icons_enabled = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = {'diagnostics' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
})
vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine

vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
require("fidget").setup({
  notification = {
    override_vim_notify = true,
    window = {
      normal_hl = "",
      winblend = 50,
      border = "none",
      avoid = { "NvimTree" }
    },
  },
})

vim.pack.add({ "https://github.com/folke/which-key.nvim" })
require("which-key").setup({
  delay = 500,
  icons = { mappings = false },
})

vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require('oil').setup({
  view_options = {
    show_hidden = true,
  }
})
vim.keymap.set("n", "<leader>oi", function() require('oil').open_float() end)

-- Editor stuff: comments, surround, undo, diagnostics
vim.pack.add({ "https://github.com/mbbill/undotree" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>")

vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })
require("Comment").setup({
  padding = true,
  sticky = true, ---Whether the cursor should stay at its position
  ignore = nil,  ---Lines to be ignored while (un)comment
  mappings = {
    ---NOTE: If given `false` then the plugin won't create any mappings
    basic = false, ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    extra = false, ---Extra mapping; `gco`, `gcO`, `gcA`
  },
})

vim.keymap.set('n', '<C-_>', function()require('Comment.api').toggle.linewise.current() end, { noremap = true })

local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)
vim.keymap.set('x', '<C-_>', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { noremap = true })

vim.pack.add({ "https://github.com/echasnovski/mini.surround" })
require("mini.surround").setup({
  opts = {
    mappings = {
      add = "sa",
      replace = "sr",
      delete = "",
      find = "",
      find_left = "",
      highlight = "",
      update_n_lines = "",
      suffix_last = "",
      suffix_next = "",
    },
    respect_selection_type = true
  }
})

vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup {
  action_keys = {
    jump = {},
    jump_close = { "<CR>" }
  },
  auto_preview = false,
  signs = {
    error = "E",
    warning = "W",
    hint = "H",
    information = "I"
  },
  use_diagnostic_signs = false
}
vim.keymap.set('n', '<leader>t', ":Trouble diagnostics toggle<CR>", { desc = 'Toggle diagnostics list' })

