return {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('monokai-pro').setup({
            filter = "spectrum",
            day_night = {
                enable = false,
                day_filter = "spectrum",
                night_filter = "spectrum",
          },
        })
        vim.cmd.colorscheme("monokai-pro-spectrum")
    end,
}
