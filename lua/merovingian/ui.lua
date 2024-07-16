---@alias MerovingianPositionUI 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right'

---@class MerovingianUI
---@field position MerovingianPositionUI
---@field win_id number
---@field buf_id number
local MerovingianUI = {}

---@return MerovingianUI
function MerovingianUI:new()
  self.__index = self
  return setmetatable({}, self)
end

---@param position MerovingianPositionUI
function MerovingianUI:show_timer(position)
  self.buf_id = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = self.buf_id })
  self.win_id = vim.api.nvim_open_win(self.buf_id, false, {
    relative = "editor",
    width = 10,
    height = 1,
    row = 0,
    col = vim.o.columns - 1,
    style = "minimal",
    focusable = false,
    border = "single",
    title = "Work!",
    title_pos = "center",
  })
end

---@param time string
function MerovingianUI:update_timer(time)
  local decoratedTime = string.format(" 󰥔 %s ", time)
  vim.api.nvim_buf_set_lines(self.buf_id, 0, -1, false, { decoratedTime })
end

function MerovingianUI:hide_timer()
  vim.api.nvim_win_close(self.win_id, true)
end

return MerovingianUI
