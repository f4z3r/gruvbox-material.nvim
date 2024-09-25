local hl = require("gruvbox-material.highlighter")
local utils = require("gruvbox-material.utils")

local DEFAULT_CONFIG = {
  italics = true,
  contrast = "medium",
  comments = {
    italics = true,
  },
  background = {
    transparent = false,
  },
  float = {
    force_background = false,
    background_color = nil,
  },
  signs = {
    highlight = true,
  },
  customize = nil,
}

---Apply defaults to base
---@param base table
---@param defaults table
---@return table
local function apply_defaults(base, defaults)
  local res = utils.table_copy(base)
  for key, default in pairs(defaults) do
    local value = base[key]
    if value == nil then
      res[key] = default
    elseif type(value) == "table" then
      res[key] = apply_defaults(value, default)
    else
      res[key] = value
    end
  end
  return res
end

local gruvbox = {}

function gruvbox.setup(config)
  config = config or {}
  local base = gruvbox.config_cache or DEFAULT_CONFIG
  local cfg = apply_defaults(config, base)
  gruvbox.config_cache = cfg

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "gruvbox-material"

  local highlighter = hl.build(cfg)
  local groups = require("gruvbox-material.groups").get(cfg.contrast)
  for group, options in pairs(groups) do
    highlighter:highlight(group, options)
  end
end

return gruvbox
