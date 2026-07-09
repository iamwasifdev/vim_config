-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cd", function()
  local ft = vim.bo.filetype
  if ft:match("^typescript") or ft:match("^javascript") then
    pcall(require("pretty-ts-errors.diagnostics").show_formatted_error)
  else
    vim.diagnostic.open_float(nil, {
      scope = "cursor",
      border = "rounded",
      source = true,
      header = "",
      prefix = function(d)
        return ({ "E:", "W:", "H:", "I:" })[d.severity] or " "
      end,
    })
  end
end, { desc = "Show Line Diagnostics" })
vim.keymap.set('n','<leader>k',vim.lsp.buf.hover,{desc="Hover"})
vim.keymap.set("n", "J", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "K", "<C-u>zz", { desc = "Scroll up" })


vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
