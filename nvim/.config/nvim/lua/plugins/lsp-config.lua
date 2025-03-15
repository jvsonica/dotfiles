local nvim_lsp = require("lspconfig")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "jose-elias-alvarez/typescript.nvim",
    },
    opts = {
        inlay_hints = {
            enabled = false,
        },
        servers = {
            -- tsserver will be automatically installed with mason and loaded with lspconfig
            tsserver = {
                root_dir = require("lspconfig.util").root_pattern("package.json"),
            },
            denols = {
                root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
                unstable = true,
                lint = true,
            },
            jsonls = {
                settings = {
                    json = {
                        format = {
                            enable = true,
                            indent_size = "4",
                        },
                    },
                },
            },
        },
        setup = {
            denols = function(_, opts)
                print(opts)
            end,
        },
    },
}
