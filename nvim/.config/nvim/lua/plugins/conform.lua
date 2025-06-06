return {
    "stevearc/conform.nvim",
    opts = {
        -- LazyVim will use these options when formatting with the conform.nvim formatter
        -- format = {
        --     timeout_ms = 3000,
        --     async = false, -- not recommended to change
        --     quiet = false, -- not recommended to change
        -- },
        formatters_by_ft = {
            lua = { "stylua" },
            sh = { "shfmt" },
            python = { "black" },
            -- python = { "ruff" },
            json = { "jq" },
            yaml = { "yamlfmt" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        formatters = {
            injected = { options = { ignore_errors = true } },
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            black = {
                prepend_args = { "--line-length", "120" },
            },
            jq = {
                prepend_args = { "--indent", "4" },
            },
            yamlfmt = {
                prepend_args = { "--formatter", "indent=4" },
            },
        },
    },
}
