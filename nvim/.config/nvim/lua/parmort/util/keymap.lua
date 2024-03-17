local M = {}
local keymap = M

function M.leader(map)
  return '<leader>' .. map
end

function M.command(map)
  return '<cmd>' .. map .. '<CR>'
end

function M.plug(map)
  return '<plug>' .. map
end

return keymap
