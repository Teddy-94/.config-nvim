return {
    "BBaoVanC/onehalf",
    config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/vim")
        vim.cmd([[colorscheme onehalfdark]])
    end
}
