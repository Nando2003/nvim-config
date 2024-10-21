return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim", opts = {} },
            { "stevearc/conform.nvim", config = function() require("confirm").setup() end },
            "b0o/SchemaStore.nvim",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "bashls",
                    "lua_ls",
                    "rust_analyzer",
                    "svelte",
                    "clangd",
                    "neocmake",
                    "dockerls",
                    "docker_compose_language_service",
                    "eslint",
                    "html",
                    "htmx",
                    "jinja_lsp",
                    "marksman",
                    "pyright",
                    "ruff_lsp",
                    "sqlls",
                    "tailwindcss",
                    "cssls",
                    "biome",
                    "volar",
                    "jsonls",
                    "yamlls",
                },
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "prettier",
                    "eslint_d",
                },
                auto_update = true,
                run_on_start = true,
            })

            local lspconfig = require("lspconfig")
            local capabilities = nil
            if pcall(require, "cmp_nvim_lsp") then
                capabilities = require("cmp_nvim_lsp").default_capabilities()
            end

            local on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting() end, bufopts)
            end

            local servers = {
                bashls = {},
                lua_ls = {},
                rust_analyzer = {},
                svelte = {},
                clangd = {},
                neocmake = {},
                dockerls = {},
                docker_compose_language_service = {},
                eslint = {},
                html = {},
                htmx = {},
                jinja_lsp = {},
                marksman = {},
                pyright = {},
                ruff_lsp = {},
                sqlls = {},
                tailwindcss = {},
                cssls = {},
                biome = {},
                volar = {},
                jsonls = {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
                yamlls = {},
            }

            -- Configurar cada servidor LSP
            for server, config in pairs(servers) do
                config.on_attach = on_attach
                config.capabilities = capabilities
                lspconfig[server].setup(config)
            end
        end,
    }
}

