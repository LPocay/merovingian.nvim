---@class MerovingianConfigType
---@field duration number
local default_config = {
  duration = 25,
}

---@class MerovingianConfig
local MerovingianConfig = {}

---@return MerovingianConfig
function MerovingianConfig:new()
  self.__index = self
  return setmetatable({
    config = default_config,
  }, self)
end

function MerovingianConfig:merge_config(config)
  self.config = vim.tbl_extend('force', self.config, config)
end

return MerovingianConfig
