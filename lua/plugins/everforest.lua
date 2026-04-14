return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("everforest").setup({
        on_highlights = function(highlight, palette)
          highlight.TSParameter = { fg = palette.yellow, bg = palette.none }
        end,
      })
    end,
  },
}
