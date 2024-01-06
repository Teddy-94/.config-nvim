-- Main init.lua.

vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Import Options and Keymaps
require("options")
require("keymaps")

-- lazy.nvim plugin management
require("lazy-nvim-setup")

vim.api.nvim_create_user_command('Ecs',
  function()
    if vim.bo.filetype == "php" then
      vim.api.nvim_command(":!docker compose -f docker-compose-qa.yaml run -e COMPOSER_MEMORY_LIMIT=4G  ecs --fix %")
    end
  end
  , {})


vim.api.nvim_create_user_command('Prettier',
  function()
    if vim.bo.filetype == "typescript" or "javascript" then
      local command = string.format("npx prettier %s", vim.fn.shellescape(vim.fn.expand("%")))
      local _ = vim.fn.system(command)
      if vim.v.shell_error ~= 0 then
        print("Error running prettier, shell_error: ", vim.v.shell_error)
      else
        vim.api.nvim_command(":%!npx prettier --stdin-filepath %")
      end
    end
  end
  , {})

vim.api.nvim_create_user_command('Fmt',
  function()
    vim.lsp.buf.format()
  end
  , {})
