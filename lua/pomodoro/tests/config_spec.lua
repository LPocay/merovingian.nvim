local merge_config = require("pomodoro.config").merge_config

describe("Configurations tests", function()
  it("Sould combine configs", function()
    local c1 = { a = 1, b = { c = 2 }, d = 3 }
    local c2 = { b = { c = 3 }, d = 4 }
    local expected = { a = 1, b = { c = 3 }, d = 4 }
    local result = merge_config(c1, c2)
    assert.are.same(expected, result)
  end)
end)
