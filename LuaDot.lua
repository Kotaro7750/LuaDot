local Array = require('./Array')
local DotNode = require('./DotNode')
local DotEdge = require('./DotEdge')

local LuaDot = {}

function LuaDot:new(name,hasDirection)
  obj = {
    hasDirection = hasDirection,
    name = name,
    node = Array:new(),
    edge = Array:new()
  }

  self.__index = self
  return setmetatable(obj,self)
end

function LuaDot:tostring()
  local graphType = self.hasDirection and 'digraph' or 'graph'

  local nodeStr = ''
  for i = 1,#self.node do
    local node = self.node[i]
    nodeStr = nodeStr .. node:tostring() .. '\n'
  end

  local edgeStr = ''
  for i = 1,#self.edge do
    local edge = self.edge[i]
    edgeStr = edgeStr .. edge:tostring() .. '\n'
  end

  return graphType .. ' ' .. self.name .. ' {\n' .. nodeStr .. '\n' .. edgeStr ..'}'
end

function LuaDot:appendNode(id,attr)
  self.node:append(DotNode:new(id,attr))
end

function LuaDot:appendEdge(from,to)
  self.edge:append(DotEdge:new(from,to,self.hasDirection))
end

return LuaDot
