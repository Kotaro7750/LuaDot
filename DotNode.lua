local DotAttribute = require('./DotAttribute')
local DotNode = {}

function DotNode:new(id,attr)
  obj = {id = id, attr = DotAttribute:new(attr)}
  self.__index = self
  return setmetatable(obj,self)
end

function DotNode:tostring()
  return self.id .. self.attr:tostring()
end

return DotNode
