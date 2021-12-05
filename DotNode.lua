local DotNode = {}

function DotNode:new(id,attr)
  obj = {id = id, attr = attr}
  self.__index = self
  return setmetatable(obj,self)
end

function DotNode:tostring()
  return self.id
end

return DotNode
