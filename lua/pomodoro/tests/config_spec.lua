local Config = require("pomodoro.config")

describe("Configurations tests", function()
  it("If user provide config, Sould combine configs", function()
    local user_config = { duration = 30 }
    local config = Config:new()
    config:merge_config(user_config)
    assert.are.same({ duration = 30 }, config.config)
  end)
  it("If user dont provide config, Sould be default config", function()
    local config = Config:new()
    assert.are.same({ duration = 25 }, config.config)
  end)
end)
