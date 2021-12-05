local Array = require('./Array')
local DotNode = require('./DotNode')
local DotEdge = require('./DotEdge')
local DotAttribute = require('./DotAttribute')

local LuaDot = {}

function LuaDot:new(id, option)
  obj = {
    id = id,
    hasDirection = option.hasDirection,
    graphAttribute = DotAttribute:new(option.graphAttribute or {}),
    nodeAttribute = DotAttribute:new(option.nodeAttribute or {}),
    edgeAttribute = DotAttribute:new(option.edgeAttribute or {}),
    node = Array:new(),
    edge = Array:new()
  }

  self.__index = self
  return setmetatable(obj,self)
end

function LuaDot:tostring()
  local graphType = self.hasDirection and 'digraph' or 'graph'

  local graphStmtStr = self.graphAttribute:tostring()
  local nodeStmtStr = self.nodeAttribute:tostring()
  local edgeStmtStr = self.edgeAttribute:tostring()

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

  return graphType .. ' ' .. self.id .. ' {\n' .. 'graph' .. graphStmtStr .. '\n' ..'node' .. nodeStmtStr .. '\n' ..'edge' .. edgeStmtStr .. '\n' .. nodeStr .. '\n' .. edgeStr ..'}'
end

function LuaDot:appendNode(id,attr)
  self.node:append(DotNode:new(id,attr))
end

function LuaDot:appendEdge(from,to)
  self.edge:append(DotEdge:new(from,to,self.hasDirection))
end

return LuaDot
