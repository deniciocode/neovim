return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format" },
    },
    formatters = {
      erb_format = {
        command = "erb-formatter",
        args = { "--print-width", "80" },
      },
    },
  },
}
