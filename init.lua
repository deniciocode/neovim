-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.o.relativenumber = false

if vim.g.gui_vimr ~= nil then
  vim.cmd("colorscheme tokyonight")
else
  vim.cmd("colorscheme everforest")
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Guardfile",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})
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
