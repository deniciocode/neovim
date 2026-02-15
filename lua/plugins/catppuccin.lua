return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- make sure it loads first
  config = function()
    require("catppuccin").setup({
      background = {
        light = "latte",
        dark = "frappe", -- override default dark flavour
      },
    })
  end,
}
