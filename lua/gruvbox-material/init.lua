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

---get global configuration if set and print deprecation warnings
---@param config table
---@return table
local function get_global_options(config)
  local opts = {
    "enable_italic_comment",
    "diagnostic_text_highlight",
    "diagnostic_virtual_text",
    "sign_column_background",
    "transparent_background",
  }

  for _, key in ipairs(opts) do
    local g_key = "gruvbox_material_" .. key
    if vim.g[g_key] ~= nil then
      vim.notify_once("gruvbox-material: setting configuration via global variables is deprecated", vim.log.levels.WARN)
      config[key] = vim.g[g_key]
    end
  end
  return config
end

---print deprecation warnings and convert to new configuration
---@param config table
---@return table
local function warn_deprecation(config)
  config = get_global_options(config)
  if config.enable_italic_comment ~= nil then
    vim.notify(
      "gruvbox-material: enable_italic_comment is deprecated, use comments.italics instead",
      vim.log.levels.WARN
    )
    config.comments.italics = utils.num_to_bool(config.enable_italic_comment)
    config.enable_italic_comment = nil
  end
  if config.diagnostic_text_highlight ~= nil then
    vim.notify("gruvbox-material: diagnostic_text_highlight is deprecated and will be ignored", vim.log.levels.WARN)
    config.diagnostic_text_highlight = nil
  end
  if config.diagnostic_virtual_text ~= nil then
    vim.notify("gruvbox-material: diagnostic_virtual_text is deprecated and will be ignored", vim.log.levels.WARN)
    config.diagnostic_virtual_text = nil
  end
  if config.transparent_background ~= nil then
    vim.notify(
      "gruvbox-material: transparent_background is deprecated, use background.transparent instead",
      vim.log.levels.WARN
    )
    config.background.transparent = utils.num_to_bool(config.transparent_background)
    config.transparent_background = nil
  end
  if config.sign_column_background ~= nil then
    vim.notify("gruvbox-material: sign_column_background is deprecated and will be ignored", vim.log.levels.WARN)
    config.sign_column_background = nil
  end
  return config
end

local gruvbox = {}

function gruvbox.setup(config)
  config = config or {}
  local cfg = apply_defaults(config, DEFAULT_CONFIG)
  cfg = warn_deprecation(cfg)

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
