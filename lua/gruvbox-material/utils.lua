local utils = {}

---@class Set
local Set = {}

---create a new Set
---@param vals any[]
---@return Set
function Set:new(vals)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  for _, val in ipairs(vals) do
    o[val] = true
  end
  return o
end

---check if a value is contained in the set
---@param val any
---@return boolean
function Set:contains(val)
  return self[val] or false
end

utils.Set = Set

---deep copy a table
---@param tbl table
---@return table
function utils.table_copy(tbl)
  local res = {}
  for k, v in pairs(tbl) do
    if type(v) == "table" then
      res[k] = utils.table_copy(v)
    else
      res[k] = v
    end
  end
  return res
end

---merge two tables
---@param tbl1 table
---@param tbl2 table
---@return table
function utils.merge_tables(tbl1, tbl2)
  local res = utils.table_copy(tbl1)
  for k, v in pairs(tbl2) do
    res[k] = v
  end
  return res
end

return utils
