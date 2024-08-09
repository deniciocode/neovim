-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set filetype to javascript for .js.erb files
vim.api.nvim_create_augroup("FileTypeJsErb", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.js.erb",
  command = "set filetype=javascript",
  group = "FileTypeJsErb",
})

-- Set filetype to json for .json.erb files
vim.api.nvim_create_augroup("FileTypeJsonErb", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json.erb",
  command = "set filetype=json",
  group = "FileTypeJsonErb",
})
