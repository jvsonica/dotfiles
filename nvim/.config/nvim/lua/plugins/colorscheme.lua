return {
    { "ellisonleao/gruvbox.nvim" },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        opts = {
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
        },
    },

    -- Configure LazyVim to load catppuccin-macchiato
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-macchiato",
        },
    },
}
