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

---convert a color from RGB to Hex format
---@param r number red value
---@param g number green value
---@param b number blue value
---@return string
function utils.rgb_to_hex(r, g, b)
  return "#" .. string.format("%02X%02X%02X", r, g, b)
end

---convert a color from hex to RGB format
---@param color string
---@return number[]
function utils.hex_to_rgb(color)
  color = color:gsub("#", "")
  return {
    tonumber("0x" .. string.sub(color, 1, 2)),
    tonumber("0x" .. string.sub(color, 3, 4)),
    tonumber("0x" .. string.sub(color, 5, 6)),
  }
end

---blend colors together
---@param top string first hex color
---@param bottom string second hex color
---@param alpha number
---@return string the resulting hex color
function utils.blend(top, bottom, alpha)
  local top_rgb = utils.hex_to_rgb(top)
  local bottom_rgb = utils.hex_to_rgb(bottom)

  local function blend(c)
    c = ((alpha * top_rgb[c]) + ((1 - alpha) * bottom_rgb[c]))
    return math.floor((math.min(math.max(0, c), 255) + 0.5))
  end

  return utils.rgb_to_hex(blend(1), blend(2), blend(3))
end

---notify message
---@param msg string
---@param level number
---@param ... any
function utils.notify(msg, level, ...)
  if pcall(_G.require, "notify") == true then
    require("notify").notify(msg:format(...), level, {
      title = "gruvbox-material.nvim",
      on_open = function(win)
        vim.api.nvim_win_set_option(win, "conceallevel", 3)
        local buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        vim.api.nvim_win_set_option(win, "spell", false)
      end,
    })
  else
    vim.notify(msg:format(...), level, {
      title = "gruvbox-material.nvim",
    })
  end
end

return utils
