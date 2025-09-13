return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            python = { "pylint" },
            markdown = { "markdownlint-cli2" },
        },
    },
}
