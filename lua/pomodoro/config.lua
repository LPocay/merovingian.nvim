local default_config = {
  duration = 25,
}

Config = {
  config = {},
}

function Config:new()
  local o = {
    config = default_config,
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Config:merge_config(config)
  self.config = vim.tbl_extend('force', self.config, config)
end

return Config
