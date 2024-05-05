local utils = require("gruvbox-material.utils")

local highlighter = {}

---@class StandardHighlighter
---@field private overrides (fun(group: string, options: table): string, table)[]
local StandardHighlighter = {}

---create a new highlighter
---@return StandardHighlighter
function StandardHighlighter:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o.overrides = {}
  return o
end

---add an override
---@param override fun(group: string, options: table): string, table
function StandardHighlighter:add_override(override)
  self.overrides[#self.overrides + 1] = override
end

---highlight a group based on options
---@param group string
---@param options table
function StandardHighlighter:highlight(group, options)
  for _, override in ipairs(self.overrides) do
    group, options = override(group, options)
  end
  vim.api.nvim_set_hl(0, group, options)
end

highlighter.StandardHighligher = StandardHighlighter

---build the highlighter based on configuration
---@param config table
---@return StandardHighlighter
function highlighter.build(config)
  local hl = StandardHighlighter:new()

  -- italics
  if not config.comments.italics and config.italics then
    local comments = utils.Set:new({ "Comment", "SpecialComment", "Todo" })
    hl:add_override(function(g, o)
      if comments:contains(g) then
        o.italic = false
      end
      return g, o
    end)
  end

  if not config.italics then
    hl:add_override(function(g, o)
      o.italic = false
      return g, o
    end)
  end

  -- background stuff
  local float = utils.Set:new({
    "NormalFloat",
    "ErrorFloat",
    "WarningFloat",
    "InfoFloat",
    "HintFloat",
  })

  if config.background.transparent then
    local background = utils.Set:new({
      "EndOfBuffer",
      "Normal",
      "RedSign",
      "OrangeSign",
      "YellowSign",
      "GreenSign",
      "AquaSign",
      "BlueSign",
      "PurpleSign",
    })
    hl:add_override(function(g, o)
      if config.float.force_background and float:contains(g) then
        return g, o
      end
      if background:contains(g) or float:contains(g) then
        o.bg = nil
      end
      return g, o
    end)
  end

  if config.float.background_color then
    hl:add_override(function(g, o)
      if float:contains(g) then
        o.bg = config.float.background_color
      end
      return g, o
    end)
  end

  return hl
end

return highlighter
