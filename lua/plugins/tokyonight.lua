return {
    "folke/tokyonight.nvim", config = function()
    require("tokyonight").setup({
        transparent = false,
        terminal_colors = true,
        styles = {
                    {italics= false },
                }
    })
end

}
