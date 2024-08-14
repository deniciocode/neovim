-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.o.relativenumber = false
vim.opt.sidescroll = 0
vim.opt.fillchars:append({ eob = " " })
vim.opt.textwidth = 80

if vim.g.gui_vimr ~= nil then
  vim.cmd("colorscheme tokyonight-storm")
else
  vim.cmd("colorscheme everforest")
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Guardfile",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

-- DeleteTrailingWhitespace Konfiguration
vim.g.DeleteTrailingWhitespace = 1
vim.g.DeleteTrailingWhitespace_Action = "delete"
-- Requires nvim-treesitter installed
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "lua", "ruby" },
  sync_install = false,
  ignore_install = { "" },
  auto_install = true,
  endwise = {
    enable = true,
  },
})
