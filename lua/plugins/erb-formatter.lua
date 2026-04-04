return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      eruby = { "erb_format" },
    },
    formatters = {
      erb_format = {
        prepend_args = { "--print-width", "80" },
      },
    },
  },
}
