utils = {}

function utils.highlight(group, color)
  local fg = color.fg or "NONE"
  local bg = color.bg or "NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""
  local style = color.style or "NONE"

  -- local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
  local hl = string.format('highlight %s gui=%s guifg=%s guibg=%s %s', group,
                           style, fg, bg, sp)

  vim.cmd(hl)

  -- Inherit colors from another group
  if color.link then
    return vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

return utils
