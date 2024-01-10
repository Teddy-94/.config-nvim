return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true, ---Whether the cursor should stay at its position
        ignore = nil, ---Lines to be ignored while (un)comment
        mappings = {
          ---NOTE: If given `false` then the plugin won't create any mappings
          basic = false, ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          extra = false, ---Extra mapping; `gco`, `gcO`, `gcA`
        },
      })

      -- I do this in order to map to '<C-/>' without having unnused keymaps
      local api = require('Comment.api')
      vim.keymap.set('n', '<C-/>', api.toggle.linewise.current, { remap = true })

      local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
      )
      -- Toggle selection (linewise)
      vim.keymap.set('x', '<C-/>', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end, { remap = true })
    end
  },
}
