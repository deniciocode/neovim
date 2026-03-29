return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local is_dark = vim.fn
      .system("defaults read -g AppleInterfaceStyle 2>/dev/null")
      :match("Dark") ~= nil
    vim.o.background = is_dark and "dark" or "light"

    require("everforest").setup({
      on_highlights = function(hl, palette)
        -- hl.TSSymbol = { link = "Yellow" } -- default is Agua
        -- hl.TSBoolean = { fg = palette.purple, bg = palette.none, bold = true }
        hl.TSParameter = { link = palette.yellow }
        hl.TSParameter = { link = "Yellow" }
      end,
    })
    vim.cmd.colorscheme("everforest")
  end,
}
