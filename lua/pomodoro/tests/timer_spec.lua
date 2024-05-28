local Timer = require("pomodoro.timer")
local spy = require("luassert.spy")
local mock = require('luassert.mock')
local stub = require('luassert.stub')

local function new_timer_mock()
  return {
    start = function(_, _, _, cb)
      cb()
    end,
    close = function() end
  }
end

describe("Timer tests", function()
  it("Run callback with timer", function()
    local duration = 1
    local callback = spy.new(function() end)
    local api = mock(vim.loop, true)
    stub(vim.loop, "new_timer", new_timer_mock)
    local timer = Timer
    timer:run_callback_with_timer(duration, callback)
    assert.spy(callback).was.called(1)
    mock.revert(api)
  end)
end)
