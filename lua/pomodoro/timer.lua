local function run_callback_with_timer(duration, callback)
  local timer = vim.loop.new_timer()
  timer:start(duration * 1000, 0, function()
    callback()
    timer:close()
  end)
end

return { run_callback_with_timer = run_callback_with_timer }
