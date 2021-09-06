local utils = require('gruvbox-material.utils')
local highlights = require('gruvbox-material.highlights')

M = {}
function M.setup()
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "gruvbox-material"
  
  -- NOTE: I think we can refactor this, but I don't know how
  for group, colors in pairs(highlights.custom()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.syntax()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.highlight_groups()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.filetype_specific()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.treesitter()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.plugin_specific()) do
    utils.highlight(group, colors)
  end
end
return M
