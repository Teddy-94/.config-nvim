vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

-- fzf-lua is loaded and configured on the first picker call instead of at startup
local configured = false
local function pick(name)
  return function()
    local fzf = require("fzf-lua")
    if not configured then
      fzf.setup({
        defaults = { file_icons = false },
        winopts = {
          width = 0.95,
          height = 0.95,
          preview = { layout = "vertical" },
        },
        lsp = { includeDeclaration = false },
      })
      configured = true
    end
    fzf[name]()
  end
end

local set = vim.keymap.set
set("n", "<leader>ff", pick("files"), { desc = "Find files" })
set("n", "<leader>fF", pick("git_files"), { desc = "Find git files" })
set("n", "<leader>fo", pick("oldfiles"), { desc = "Find recently opened files" })
set("n", "<leader>/", pick("live_grep"), { desc = "Live grep" })
set("n", "<C-f>", pick("live_grep"), { desc = "Live grep" })
set("n", "<leader>fg", pick("grep_cword"), { desc = "Grep word under cursor" })
set("x", "<leader>fg", pick("grep_visual"), { desc = "Grep selection" })
set("n", "<leader>fh", pick("helptags"), { desc = "Search help" })
set("n", "<leader>fm", pick("manpages"), { desc = "Search man pages" })

set("n", "<leader>T", pick("builtin"), { desc = "All fzf-lua pickers" })

set("n", "gd", pick("lsp_definitions"), { desc = "Go to definition" })
set("n", "gr", pick("lsp_references"), { desc = "Go to references" })
set("n", "gi", pick("lsp_implementations"), { desc = "Go to implementation" })
