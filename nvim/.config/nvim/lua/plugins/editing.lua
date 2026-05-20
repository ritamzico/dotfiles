return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        version = "*",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gstatus", "Gcommit", "Gpush", "Gdiff" },
        keys = {
            { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
            { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
            { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer (conform)",
            },
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
