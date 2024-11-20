-- Function to unfocus all spec blocks and jump back to the current line
vim.api.nvim_create_user_command("UnfocusSpecs", function()
  -- Save the current cursor position
  local current_line = vim.fn.line(".")
  local current_col = vim.fn.col(".")

  -- Execute the search and replace to remove 'f' prefix
  vim.cmd([[%s/\<f\(context\|describe\|it\)/\1/g]])

  -- Restore the cursor to the original position
  vim.fn.cursor(current_line, current_col)
end, { desc = "Unfocus all spec blocks and return to current line" })

-- Optional: Map the command to a keybinding
vim.keymap.set("n", "<leader>cu", ":UnfocusSpecs<CR>", {
  noremap = true,
  silent = true,
  desc = "Unfocus specs and return to current line",
})
