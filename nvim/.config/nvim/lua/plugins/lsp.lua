return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "jsonls",
                    "html",
                    "cssls",
                    "tailwindcss",
                },
                automatic_enable = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("gt", vim.lsp.buf.type_definition, "Go to type definition")
                    map("gr", require("telescope.builtin").lsp_references, "Go to references")
                    map("K", vim.lsp.buf.hover, "Hover docs")
                    map("<leader>gD", vim.lsp.buf.definition, "Go to definition")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "Workspace symbols")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
                    map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
                    map("<leader>q", vim.diagnostic.setloclist, "Diagnostic list")
                end,
            })

            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = { border = "rounded" },
            })

            vim.lsp.handlers["textDocument/hover"] =
                vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
        end,
    },
}
