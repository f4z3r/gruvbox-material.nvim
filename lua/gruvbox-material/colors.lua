local utils = require("gruvbox-material.utils")

local colors = {}

local base = {
  dark = {
    red = "#ea6962",
    orange = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    aqua = "#89b482",
    blue = "#7daea3",
    purple = "#d3869b",

    bg_yellow = "#d8a657",
    bg_red = "#ea6962",
    bg_green = "#a9b665",

    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",

    fg0 = "#d4be98",
    fg1 = "#ddc7a1",
  },
  light = {
    red = "#c14a4a",
    orange = "#c35e0a",
    yellow = "#b47109",
    green = "#6c782e",
    aqua = "#4c7a5d",
    blue = "#45707a",
    purple = "#945e80",

    bg_yellow = "#a96b2c",
    bg_red = "#ae5858",
    bg_green = "#6f8352",

    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",

    fg0 = "#654735",
    fg1 = "#4f3829",
  },
}

local contrasts = {
  dark = {
    hard = {
      bg0 = "#1d2021",
      bg1 = "#282828",
      bg2 = "#282828",
      bg3 = "#3c3836",
      bg4 = "#3c3836",
      bg5 = "#504945",
      bg_statusline1 = "#282828",
      bg_statusline2 = "#32302f",
      bg_statusline3 = "#504945",
      bg_visual_green = "#333e34",
      bg_visual_red = "#442e2d",
      bg_visual_blue = "#2e3b3b",
      bg_visual_yellow = "#473c29",
      bg_current_word = "#32302f",
      bg_diff_red = "#3c1f1e",
      bg_diff_green = "#32361a",
      bg_diff_blue = "#0d3138",

      term = {
        bg5 = 239,
      },
    },
    medium = {
      bg0 = "#282828",
      bg1 = "#32302f",
      bg2 = "#32302f",
      bg3 = "#45403d",
      bg4 = "#45403d",
      bg5 = "#5a524c",
      bg_statusline1 = "#32302f",
      bg_statusline2 = "#3a3735",
      bg_statusline3 = "#504945",
      bg_visual_green = "#3b4439",
      bg_visual_red = "#4c3432",
      bg_visual_blue = "#374141",
      bg_visual_yellow = "#4f422e",
      bg_current_word = "#3c3836",
      bg_diff_red = "#402120",
      bg_diff_green = "#34381b",
      bg_diff_blue = "#0e363e",

      term = {
        bg5 = 239,
      },
    },
    soft = {
      bg0 = "#32302f",
      bg1 = "#3c3836",
      bg2 = "#3c3836",
      bg3 = "#504945",
      bg4 = "#504945",
      bg5 = "#665c54",
      bg_statusline1 = "#3c3836",
      bg_statusline2 = "#46413e",
      bg_statusline3 = "#5b534d",
      bg_visual_green = "#424a3e",
      bg_visual_red = "#543937",
      bg_visual_blue = "#404946",
      bg_visual_yellow = "#574833",
      bg_current_word = "#45403d",
      bg_diff_red = "#472322",
      bg_diff_green = "#3d4220",
      bg_diff_blue = "#0f3a42",

      term = {
        bg5 = 239,
      },
    },
  },
  light = {
    hard = {
      bg0 = "#f9f5d7",
      bg1 = "#f5edca",
      bg2 = "#f3eac7",
      bg3 = "#f2e5bc",
      bg4 = "#eee0b7",
      bg5 = "#ebdbb2",
      bg_statusline1 = "#f5edca",
      bg_statusline2 = "#f3eac7",
      bg_statusline3 = "#eee0b7",
      bg_visual_green = "#dde5c2",
      bg_visual_red = "#f0ddc3",
      bg_visual_blue = "#d9e1cc",
      bg_visual_yellow = "#f9eabf",
      bg_current_word = "#f3eac7",
      bg_diff_red = "#f8e4c9",
      bg_diff_green = "#e4edc8",
      bg_diff_blue = "#e0e9d3",

      term = {
        bg5 = 250,
      },
    },
    medium = {
      bg0 = "#fbf1c7",
      bg1 = "#f4e8be",
      bg2 = "#f2e5bc",
      bg3 = "#eee0b7",
      bg4 = "#e5d5ad",
      bg5 = "#ddccab",
      bg_statusline1 = "#f2e5bc",
      bg_statusline2 = "#f2e5bc",
      bg_statusline3 = "#e5d5ad",
      bg_visual_green = "#dee2b6",
      bg_visual_red = "#f1d9b5",
      bg_visual_blue = "#dadec0",
      bg_visual_yellow = "#fae7b3",
      bg_current_word = "#f2e5bc",
      bg_diff_red = "#f9e0bb",
      bg_diff_green = "#e6eabc",
      bg_diff_blue = "#e2e6c7",

      term = {
        bg5 = 250,
      },
    },
    soft = {
      bg0 = "#f2e5bc",
      bg1 = "#eddeb5",
      bg2 = "#ebdbb2",
      bg3 = "#e6d5ae",
      bg4 = "#dac9a5",
      bg5 = "#d5c4a1",
      bg_statusline1 = "#ebdbb2",
      bg_statusline2 = "#ebdbb2",
      bg_statusline3 = "#dac9a5",
      bg_visual_green = "#d7d9ae",
      bg_visual_red = "#efd2b3",
      bg_visual_blue = "#d3d5b8",
      bg_visual_yellow = "#f3deaa",
      bg_current_word = "#ebdbb2",
      bg_diff_red = "#f7d9b9",
      bg_diff_green = "#dfe1b4",
      bg_diff_blue = "#dbddbf",

      term = {
        bg5 = 250,
      },
    },
  },
}

---@alias Contrast
--- | "hard"
--- | "medium"
--- | "soft"

---@alias Background
--- | "light"
--- | "dark"

---get the colors table for a background and a contrast
---@param background Background
---@param contrast Contrast
---@return table
function colors.get(background, contrast)
  local base_colors = base[background]
  local overlay = contrasts[background][contrast]
  return utils.merge_tables(base_colors, overlay)
end

return colors
