vim.g.mapleader = " "

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Moving selected linses
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Curser stays in same spot
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pasting over word keeps passed word in buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Use system clipboard for copy pasting
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Replace word currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file ex
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Indenting visual block doesn't go out of visual block
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
