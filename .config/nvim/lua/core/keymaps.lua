vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-n>", ":Neotree toggle left<CR>")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>e", vim.diagnostic.open_float)
