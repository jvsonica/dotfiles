return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            python = { "pylint" },
            -- javascript = { "eslint" },
            -- javascriptreact = { "eslint" },
            -- typescript = { "eslint" },
            -- typescriptreact = { "eslint" },
            markdown = { "markdownlint-cli2" },
        },
    },
}
