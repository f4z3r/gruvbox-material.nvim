local M = {}

---return a lualine compatible theme
---@param contrast Contrast
---@return table
function M.theme(contrast)
  local g_colors = require("gruvbox-material.colors")
  local colors = g_colors.get(vim.o.background, contrast)
  return {
    normal = {
      a = { fg = colors.bg_statusline1, bg = colors.green },
      b = { fg = colors.fg0, bg = colors.bg_statusline1 },
      c = { fg = "NONE", bg = "NONE" },
    },
    insert = {
      a = { fg = colors.bg_statusline1, bg = colors.blue },
      b = { fg = colors.fg0, bg = colors.bg_statusline1 },
      c = { fg = "NONE", bg = "NONE" },
    },
    visual = {
      a = { fg = colors.bg_statusline1, bg = colors.yellow },
      b = { fg = colors.fg0, bg = colors.bg_statusline1 },
      c = { fg = "NONE", bg = "NONE" },
    },
    replace = {
      a = { fg = colors.bg_statusline1, bg = colors.red },
      b = { fg = colors.fg0, bg = colors.bg_statusline1 },
      c = { fg = "NONE", bg = "NONE" },
    },
    command = {
      a = { fg = colors.bg_statusline1, bg = colors.aqua },
      b = { fg = colors.fg0, bg = colors.bg_statusline1 },
      c = { fg = "NONE", bg = "NONE" },
    },
    inactive = {
      a = { fg = colors.fg0, bg = "NONE" },
      b = { fg = colors.fg0, bg = "NONE" },
      c = { fg = colors.fg0, bg = "NONE" },
    },
  }
end

return M
