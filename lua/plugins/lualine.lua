local lsp_progress = {
  'lsp_progress',
  display_components = {
    'lsp_client_name', { 'title', 'percentage', 'message' }
  }
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'WhoIsSethDaniel/lualine-lsp-progress.nvim' },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = false,
        globalstatus = true,
        component_separators = {},
        section_separators = {},
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 }, lsp_progress },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    })
    vim.o.laststatus = 3 -- removes the nvim statusbar since we are using lualine
  end
}
