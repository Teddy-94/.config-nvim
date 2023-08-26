return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc'},
    highlight = {
                -- false will disable the whole extension
                enable = true,
            },
    } end
   }
