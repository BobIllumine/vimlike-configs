return {
    "Bekaboo/dropbar.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    event = "BufReadPost",
    keys = {
        { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick breadcrumb" },
    },
    opts = {
        bar = {
            enable = function(buf, win, _)
                if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
                    return false
                end
                if vim.fn.win_gettype(win) ~= "" or vim.wo[win].diff or vim.bo[buf].buftype ~= "" then
                    return false
                end
                -- Symbol providers time out on huge files; config.jsonpath
                -- draws the winbar for those instead.
                return true
            end,
        },
    },
}
