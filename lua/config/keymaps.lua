-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>ov",
  ":Eview ",
  { noremap = true, silent = false, desc = "Edit Rails view" }
)
vim.keymap.set(
  "n",
  "<leader>oc",
  ":Econtroller ",
  { noremap = true, silent = false, desc = "Edit Rails controller" }
)
vim.keymap.set(
  "n",
  "<leader>om",
  ":Emodel ",
  { noremap = true, silent = false, desc = "Edit Rails model" }
)

-- Open Rails helper
vim.keymap.set(
  "n",
  "<leader>oh",
  ":Ehelper ",
  { noremap = true, silent = false, desc = "Edit Rails helper" }
)

-- Open Rails migration
vim.keymap.set(
  "n",
  "<leader>og",
  ":Emigration ",
  { noremap = true, silent = false, desc = "Edit Rails migration" }
)

-- Open Rails spec (RSpec file)
vim.keymap.set(
  "n",
  "<leader>ot",
  ":Espec ",
  { noremap = true, silent = false, desc = "Edit Rails spec file" }
)

-- Open Rails schema
vim.keymap.set(
  "n",
  "<leader>os",
  ":Eschema ",
  { noremap = true, silent = false, desc = "View Rails schema" }
)
