-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("scripts.breather")

local function scheme_for_bg(bg)
  return bg == "dark" and "catppuccin" or "everforest"
end

local updating = false

local function detect_macos_appearance()
  local is_dark = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null"):match("Dark") ~= nil
  local bg = is_dark and "dark" or "light"
  if vim.o.background ~= bg then
    updating = true
    vim.o.background = bg
    vim.cmd.colorscheme(scheme_for_bg(bg))
    updating = false
  end
end

detect_macos_appearance()

vim.fn.timer_start(5000, function()
  detect_macos_appearance()
end, { ["repeat"] = -1 })

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if not updating then
      vim.cmd.colorscheme(scheme_for_bg(vim.o.background))
    end
  end,
})
