vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- <leader>pv handled by nvim-tree plugin

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", '"_dP')
map({ "n", "v" }, "<leader>d", '"_d')

map({ "n", "v" }, "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- <C-h/j/k/l> handled by vim-tmux-navigator plugin

map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")

map("n", "<leader>qo", "<cmd>copen<cr>")
map("n", "<leader>qc", "<cmd>cclose<cr>")
map("n", "]q", "<cmd>cnext<cr>")
map("n", "[q", "<cmd>cprev<cr>")

map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end)
