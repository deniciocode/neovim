-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.o.relativenumber = false

vim.cmd("colorscheme everforest")
-- Requires nvim-treesitter installed
require("nvim-treesitter.configs").setup({
  endwise = {
    enable = true,
  },
})
