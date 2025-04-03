-- This extends config at
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/dap/core.lua
return {
    "mfussenegger/nvim-dap",
    -- stylua: ignore
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "Continue" },
        { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<F10>", function() require("dap").step_into() end, desc = "Step into" },
        { "<F11>", function() require("dap").step_over() end, desc = "Step over" },
        { "<F12>", function() require("dap").step_out() end, desc = "Step out" },
    },
}
