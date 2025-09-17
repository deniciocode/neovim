-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.rspec_keymaps")
require("scripts.breather")

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.o.relativenumber = false
vim.opt.sidescroll = 0
vim.opt.fillchars:append({ eob = " " })
vim.opt.textwidth = 80

if vim.g.gui_vimr ~= nil then
  vim.cmd("colorscheme catppuccin")
else
  vim.cmd("colorscheme everforest")
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Guardfile",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})
require("conform").setup({
  formatters = {
    erb = {
      command = "erb-formatter",
      args = { "--print-width", "80" },
    },
  },
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.yml",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

vim.api.nvim_set_keymap(
  "i", -- insert mode
  "<C-e>", -- shortcut (Ctrl + e)
  "<%=  %><Left><Left><Left>",
  { noremap = true, silent = true }
)
-- DeleteTrailingWhitespace Konfiguration
vim.g.DeleteTrailingWhitespace = 1
vim.g.DeleteTrailingWhitespace_Action = "delete"
