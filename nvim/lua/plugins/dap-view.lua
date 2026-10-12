-- Full name for the active tab, just the jump key for the rest,
-- so every tab fits in the narrow right-hand panel
local function tab(id, name, key)
    return {
        keymap = key,
        label = function(_, current)
            return current == id and name or key
        end,
    }
end

return {
    "igorlfs/nvim-dap-view",
    lazy = true,
    opts = {
        -- open the panel when a session starts, close it when it ends
        auto_toggle = true,
        windows = {
            position = "right",
            size = 0.4,
            terminal = {
                -- default "left" would squeeze the program output between
                -- your code and the panel; stack it under the panel instead
                position = "below",
            },
        },
        winbar = {
            -- the letters already are the keymaps, so drop the "[W]" hints
            show_keymap_hints = false,
            base_sections = {
                watches = tab("watches", "Watches", "W"),
                scopes = tab("scopes", "Scopes", "S"),
                exceptions = tab("exceptions", "Exceptions", "E"),
                breakpoints = tab("breakpoints", "Breakpoints", "B"),
                threads = tab("threads", "Threads", "T"),
                repl = tab("repl", "REPL", "R"),
                sessions = tab("sessions", "Sessions", "K"),
                console = tab("console", "Console", "C"),
            },
        },
    },
    keys = {
        { "<leader>Dv", "<cmd>DapViewToggle<CR>", desc = "Toggle debug view" },
        { "<leader>Dw", "<cmd>DapViewWatch<CR>", desc = "Watch expression under cursor" },
    },
}
