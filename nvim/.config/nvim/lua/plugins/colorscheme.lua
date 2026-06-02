return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				telescope = true,
				treesitter = true,
				mason = true,
				gitsigns = true,
				cmp = true,
				which_key = true,
				nvimtree = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
