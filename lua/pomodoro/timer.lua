Timer = {
  timer = nil,
}

function Timer:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Timer:run_callback_with_timer(duration, callback)
  self.timer = vim.loop.new_timer()
  self.timer:start(duration * 1000, 0, function()
    callback()
    self.timer:close()
  end)
end

return Timer
