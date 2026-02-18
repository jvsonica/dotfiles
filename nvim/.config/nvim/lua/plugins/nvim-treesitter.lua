return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false, -- ensure it loads normally
        build = ":TSUpdate",
        opts = {
            -- LazyVim config for treesitter
            indent = { enable = true }, ---@type lazyvim.TSFeat
            highlight = { enable = true }, ---@type lazyvim.TSFeat
            folds = { enable = true }, ---@type lazyvim.TSFeat
            ensure_installed = {
                "bash",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "xml",
                "yaml",
            },
            auto_install = false, -- prevent Mason from downloading the latest CLI
        },
        config = function()
            local ts_install = require("nvim-treesitter.install")
            ts_install.tree_sitter_cli = "~/.local/bin/tree-sitter" -- point to your GLIBC 2.36-compatible CLI
        end,
    },
}
