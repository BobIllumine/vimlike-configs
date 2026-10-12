
require('keys/alias')
vim.g.mapleader = " "

vm("K", ":m '<-2<CR>gv=gv", "Move selection up")
vm("J", ":m '>+1<CR>gv=gv", "Move selection down")

nm("<leader>sv", "<C-w>v", "Split window vertically")
nm("<leader>sh", "<C-w>s", "Split window horizontally")
nm("<leader>se", "<C-w>=", "Equalize split sizes")
nm("<leader>sx", "<cmd>close<CR>", "Close current split")
nm("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")
nm("<leader>D", "<Nop>", "Debug")
nm("<leader>s", "<Nop>", "Session")
nm("<leader>x", "<Nop>", "Diagnostics")

vm("<", "<gv", "Indent left and reselect")
vm(">", ">gv", "Indent right and reselect")

nm("<C-h>", "<C-w>h", "Go to left window")
nm("<C-j>", "<C-w>j", "Go to lower window")
nm("<C-k>", "<C-w>k", "Go to upper window")
nm("<C-l>", "<C-w>l", "Go to right window")

nm("<C-d>", "<C-d>zz", "Scroll down half page and center")
nm("<C-u>", "<C-u>zz", "Scroll up half page and center")
nm("n", "nzzzv", "Next search match (centered)")
nm("N", "Nzzzv", "Previous search match (centered)")


tm("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
tm("<C-h>", "<C-\\><C-n><C-h>", "Go to left window")
tm("<C-j>", "<C-\\><C-n><C-j>", "Go to lower window")
tm("<C-k>", "<C-\\><C-n><C-k>", "Go to upper window")
tm("<C-l>", "<C-\\><C-n><C-l>", "Go to right window")
nm("<leader>tt", "<cmd>split | terminal<CR>", "Open terminal in split")

im("<M-h>", "<Left>", "Cursor left")
im("<M-j>", "<Down>", "Cursor down")
im("<M-k>", "<Up>", "Cursor up")
im("<M-l>", "<Right>", "Cursor right")

im("<M-b>", "<C-o>b", "Jump to previous word")
im("<M-w>", "<C-o>w", "Jump to next word")
im("<M-$>", "<C-o>$", "Jump to end of line")
im("<M-0>", "<C-o>0", "Jump to start of line")
