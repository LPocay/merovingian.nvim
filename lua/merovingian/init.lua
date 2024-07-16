local MerovingianUI = require("merovingian.ui")
local function setup(partial_config)
  local ui_m = MerovingianUI:new()
  local timer = require("merovingian.timer"):new(1500)
  timer:start_new_timer(function()
    ui_m:update_timer(timer:get_remaining_time())
  end)
  ui_m:show_timer("top-left")
  require("notify")("My super important message")
end

return { setup = setup }
