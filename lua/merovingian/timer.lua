---@class MerovingianTimer
---@field timer? uv_timer_t
---@field callback? function
---@field time_left_in_ms? number
---@field duration_in_sec? number
---@field private step_duration_in_ms? number
local MerovingianTimer = {}

---@param duration number @Duration in seconds
---@return MerovingianTimer
function MerovingianTimer:new(duration)
  self.__index = self
  return setmetatable({
    timer = nil,
    callback = nil,
    time_left_in_ms = duration * 1000,
    duration_in_sec = duration,
    step_duration_in_ms = 1000
  }, self)
end

---@param callback function @Callback to be called after the timer ends
function MerovingianTimer:start_new_timer(callback)
  self.timer = vim.loop.new_timer()
  self.callback = callback
  self.timer:start(0, self.step_duration_in_ms, vim.schedule_wrap(function()
    self.time_left_in_ms = self.time_left_in_ms - self.step_duration_in_ms
    if self.time_left_in_ms <= 0 then
      self.timer:stop()
      self.callback()
    end
  end))
end

---@return string
function MerovingianTimer:get_remaining_time()
  local minutes = math.floor(self.time_left_in_ms / 60000)
  local seconds = math.floor((self.time_left_in_ms % 60000) / 1000)
  return string.format("%02d:%02d", minutes, seconds)
end

function MerovingianTimer:pause()
  self.timer:stop()
end

function MerovingianTimer:resume()
end

return MerovingianTimer
