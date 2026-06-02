return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            hijack_directories = {
                enable = true,
                auto_open = false,
            },
            view = {
                width = 35,
                side = "left",
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                custom = { "^.git$" },
            },
            git = { enable = true, ignore = false },
            actions = {
                open_file = {
                    quit_on_open = false,
                    window_picker = { enable = true },
                },
            },
        })

        vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
        vim.keymap.set("n", "<leader>pF", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal file in tree" })
    end,
}
