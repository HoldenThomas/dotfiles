vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.cmd [[ set clipboard+=unnamedplus ]]
vim.cmd [[ set mouse=a ]]
vim.cmd [[ set ignorecase ]]
vim.cmd [[ set smartcase ]]
vim.cmd [[ set splitbelow splitright ]]

-- Indenting visual block doesn't go out of visual block
vim.cmd [[ vmap < <gv ]]
vim.cmd [[ vmap > >gv ]]

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
