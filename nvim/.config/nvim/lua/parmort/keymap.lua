local M = {}

--- @param map string
function M.leader(map)
  return '<leader>' .. map
end

--- @param map string
function M.command(map)
  return '<cmd>' .. map .. '<CR>'
end

--- @param map string
function M.plug(map)
  return '<plug>' .. map
end

return M
