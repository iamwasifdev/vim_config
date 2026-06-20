-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })

vim.keymap.set("n", "J", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "K", "<C-u>zz", { desc = "Scroll up" })


vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
