return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      local is_dark = vim.fn
        .system("defaults read -g AppleInterfaceStyle 2>/dev/null")
        :match("Dark") ~= nil
      vim.o.background = is_dark and "dark" or "light"

      require("everforest").setup({
        on_highlights = function(highlight, palette)
          highlight.TSParameter = { fg = palette.yellow, bg = palette.none }
        end,
      })
      vim.cmd.colorscheme("everforest")
    end,
  },
}
