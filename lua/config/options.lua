-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.opt.relativenumber = false
vim.opt.fillchars:append({ eob = " " })
vim.opt.textwidth = 80

vim.filetype.add({
  extension = {
    mjml = "mjml",
  },
})

-- MJML has no dedicated treesitter grammar; use the html parser
vim.treesitter.language.register("html", "mjml")
