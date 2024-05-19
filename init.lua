-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.o.relativenumber = false

vim.cmd("colorscheme everforest")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Guardfile",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})
-- Requires nvim-treesitter installed
require("nvim-treesitter.configs").setup({
  endwise = {
    enable = true,
  },
})
