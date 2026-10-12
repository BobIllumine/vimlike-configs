return {
    "mfussenegger/nvim-dap",
    dependencies = { "igorlfs/nvim-dap-view" },
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "Debug: continue" },
        { "<F10>", function() require("dap").step_over() end, desc = "Debug: step over" },
        { "<F11>", function() require("dap").step_into() end, desc = "Debug: step into" },
        { "<F12>", function() require("dap").step_out() end, desc = "Debug: step out" },

        { "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<leader>DB", function()
            require("dap").set_breakpoint(vim.fn.input("Condition > "))
        end, desc = "Conditional breakpoint" },
        { "<leader>Dc", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
        { "<leader>Dl", function() require("dap").run_last() end, desc = "Rerun last session" },
        { "<leader>Dr", function() require("dap").repl.toggle() end, desc = "Toggle debug REPL" },
        { "<leader>Dq", function() require("dap").terminate() end, desc = "Stop debugging" },

        -- rustaceanvim builds the target and starts the session with codelldb
        { "<leader>Dd", "<cmd>RustLsp debuggables<CR>", ft = "rust", desc = "Pick Rust target to debug" },
    },
    config = function()
        local signs = {
            DapBreakpoint = { text = "●", texthl = "DiagnosticError" },
            DapBreakpointCondition = { text = "◆", texthl = "DiagnosticWarn" },
            DapLogPoint = { text = "◉", texthl = "DiagnosticInfo" },
            DapBreakpointRejected = { text = "○", texthl = "DiagnosticHint" },
            -- current execution line: arrow plus a highlighted line
            DapStopped = { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" },
        }
        for name, sign in pairs(signs) do
            vim.fn.sign_define(name, sign)
        end
        require("dap").defaults.rust.exception_breakpoints = { "rust_panic" }
    end,
}
