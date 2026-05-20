return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                file_ignore_patterns = { "node_modules", ".git/" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob=!.git/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = { "rg", "--files", "--hidden", "--glob=!.git/" },
                },
            },
        })

        pcall(telescope.load_extension, "fzf")

        local map = vim.keymap.set
        map("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
        map("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
        map("n", "<leader>ps", builtin.live_grep, { desc = "Grep string" })
        map("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
        map("n", "<leader>ph", builtin.help_tags, { desc = "Help tags" })
        map("n", "<leader>pd", builtin.diagnostics, { desc = "Diagnostics" })
        map("n", "<leader>pr", builtin.resume, { desc = "Resume last search" })
    end,
}
