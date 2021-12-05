local Array = {}

function Array:new()
  obj = {}
  self.__index = self
  return setmetatable(obj,self)
end

function Array:append(obj)
  local nextIndex = #self + 1
  self[nextIndex] = obj
end

return Array
