local DotAttribute = {}

function DotAttribute:new(attr)
  obj = {attr = attr}
  self.__index = self
  return setmetatable(obj,self)
end

function DotAttribute:tostring()
  attrStr = '['

  for key, value in pairs(self.attr) do
    attrStr = attrStr .. key .. '=' .. '"' .. value .. '";'
  end
  attrStr = attrStr .. ']'

  return attrStr
end

return DotAttribute
