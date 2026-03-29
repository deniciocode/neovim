return {
  "vim-scripts/DeleteTrailingWhitespace",
  init = function()
    vim.g.DeleteTrailingWhitespace = 1
    vim.g.DeleteTrailingWhitespace_Action = "delete"
  end,
}
