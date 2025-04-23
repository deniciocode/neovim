local M = {}

local patterns = {
  focus = {
    name = "Box Breathing",
    steps = { 4, 4, 4, 4 },
    labels = { "Inhale", "Hold", "Exhale", "Hold" },
  },
  sleep = {
    name = "4-7-8 Breathing",
    steps = { 4, 7, 8 },
    labels = { "Inhale", "Hold", "Exhale" },
  },
}

local function show_float()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 30
  local height = 3
  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    border = "rounded",
  }
  vim.api.nvim_open_win(buf, true, opts)
  return buf
end

local function update_buf(buf, text)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "", text, "" })
end

local function countdown(buf, label, duration, cb)
  local time_left = duration
  local timer = vim.loop.new_timer()

  local function tick()
    if time_left <= 0 then
      timer:stop()
      timer:close()
      cb()
    else
      update_buf(buf, string.format("%s: %ds", label, time_left))
      time_left = time_left - 1
    end
  end

  tick() -- initial display
  timer:start(1000, 1000, vim.schedule_wrap(tick))
end

local function breath_cycle(pattern)
  local buf = show_float()
  update_buf(buf, "Ready...")
  vim.defer_fn(function()
    local steps = pattern.steps
    local labels = pattern.labels
    local i = 1

    local function run_next()
      if i > #steps then
        update_buf(buf, "Done ✔")
        vim.defer_fn(function()
          vim.api.nvim_buf_delete(buf, { force = true })
        end, 1500)
        return
      end
      countdown(buf, labels[i], steps[i], function()
        i = i + 1
        run_next()
      end)
    end

    run_next()
  end, 500)
end

M.start = function(mode)
  local pattern = patterns[mode]
  if not pattern then
    vim.notify("Unknown mode: " .. mode)
    return
  end
  breath_cycle(pattern)
end

vim.api.nvim_create_user_command("BreathFocus", function()
  M.start("focus")
end, {})
vim.api.nvim_create_user_command("BreathSleep", function()
  M.start("sleep")
end, {})

return M
