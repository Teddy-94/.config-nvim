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
vim.keymap.set('n', '<leader>c', function() require('Comment.api').toggle.linewise.current() end, { noremap = true })
local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)

vim.keymap.set('x', '<leader>c', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { noremap = true })

