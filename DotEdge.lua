local DotEdge = {}

function DotEdge:new(from,to,hasDirection)
  obj = {from = from, to = to, hasDirection = hasDirection}
  self.__index = self
  return setmetatable(obj,self)
end

function DotEdge:tostring()
  local edgeOp
  if self.hasDirection then
    edgeOp = '->'
  else
    edgeOp = '--'
  end

  return self.from .. ' ' .. edgeOp .. ' ' .. self.to
end

return DotEdge
