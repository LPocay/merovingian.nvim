local MerovingianTimer = require("merovingian.timer")
local spy = require("luassert.spy")
local mock = require('luassert.mock')
local stub = require('luassert.stub')

local function new_timer_mock()
  return {
    start = function(_, _, _, cb)
      cb()
    end,
    close = function() end,
    stop = function() end
  }
end

describe("Timer tests", function()
  it("Start the timer a run callback after", function()
    local co = coroutine.running()
    local duration_in_seconds = 1
    -- Mocking vim.loop.new_timer
    local api = mock(vim.loop, true)
    stub(vim.loop, "new_timer", new_timer_mock)
    local callback = spy.new(function()
      coroutine.resume(co)
    end)
    local timer = MerovingianTimer:new(duration_in_seconds)
    timer:start_new_timer(callback)
    coroutine.yield(co)
    assert.spy(callback).was.called(1)
    mock.revert(api)
  end)

  it("Caculate remaining time in MM:SS format", function()
    local duration_in_seconds = 1500
    local api = mock(vim.loop, true)
    stub(vim.loop, "new_timer", new_timer_mock)
    local timer = MerovingianTimer:new(duration_in_seconds)
    local remaining_time = timer:get_remaining_time()
    assert.are.same("25:00", remaining_time)
    mock.revert(api)
  end)
end)
