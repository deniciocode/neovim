return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000, -- make sure it loads first
  config = function()
    require("catppuccin").setup({
      background = {
        light = "latte",
        dark = "frappe",
      },
    })
  end,
}
