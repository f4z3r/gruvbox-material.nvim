# Lua API Reference

This document covers the Lua API for gruvbox-material.nvim.

## Table of Contents

- [Setup Function](#setup-function)
- [Colors API](#colors-api)
- [Lualine Theme](#lualine-theme)

---

## Setup Function

The `setup` function initializes the colorscheme with custom configuration.

```lua
require('gruvbox-material').setup(config)
```

### Parameters

| Parameter | Type     | Description                  |
| --------- | -------- | ---------------------------- |
| `config`  | `table?` | Optional configuration table |

### Configuration Options

```lua
require('gruvbox-material').setup({
  italics = true,             -- enable italics in general
  contrast = "medium",        -- set contrast, can be any of "hard", "medium", "soft"
  comments = {
    italics = true,           -- enable italic comments
  },
  background = {
    transparent = false,      -- set the background to be opaque
  },
  float = {
    force_background = false, -- set to true to force backgrounds on floats even when
                              -- background.transparent is set
    background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
                              -- by the color scheme
  },
  signs = {
    force_background = false, -- set to true to force backgrounds on signs even when
                              -- background.transparent is set
    background_color = nil,   -- set color for sign backgrounds. If nil, uses the default color set
                              -- by the color scheme
  },
  customize = nil,            -- customize the theme in any way you desire
})
```

### Contrast Options

| Value      | Description                               |
| ---------- | ----------------------------------------- |
| `"hard"`   | Highest contrast, more defined boundaries |
| `"medium"` | Balanced contrast (default)               |
| `"soft"`   | Muted contrast, easier on the eyes        |

### The `customize` Callback

The `customize` option accepts a function to modify highlight groups on the fly. This is useful for overriding specific highlight groups.

```lua
require('gruvbox-material').setup({
  customize = function(group, options)
    -- group: the highlight group name (e.g., "Function", "Comment")
    -- options: table with highlight attributes

    -- Example: change all functions to bold orange
    if group == "Function" then
      options.fg = "#e78a4e"
      options.bold = true
    end

    -- Example: disable bold for comments
    if group == "Comment" then
      options.bold = false
    end

    -- Return the modified options
    return options
  end,
})
```

#### Available Highlight Attributes

The options table can contain any valid Neovim highlight attributes:

| Attribute       | Type      | Description                              |
| --------------- | --------- | ---------------------------------------- |
| `fg`            | `string`  | Foreground color (hex format: "#rrggbb") |
| `bg`            | `string`  | Background color (hex format: "#rrggbb") |
| `bold`          | `boolean` | Bold text                                |
| `italic`        | `boolean` | Italic text                              |
| `underline`     | `boolean` | Underlined text                          |
| `strikethrough` | `boolean` | Strikethrough text                       |
| `reverse`       | `boolean` | Reverse foreground/background            |
| `link`          | `string`  | Link to another highlight group          |

---

## Colors API

The colors module provides access to all Gruvbox Material color values. This is useful when you need to match other plugins or custom highlights to the colorscheme.

### Getting Colors

```lua
local colors = require("gruvbox-material.colors").get(background, contrast)
```

### Parameters

| Parameter    | Type                              | Description         |
| ------------ | --------------------------------- | ------------------- |
| `background` | `"dark"` or `"light"`             | The background mode |
| `contrast`   | `"hard"`, `"medium"`, or `"soft"` | The contrast level  |

### Return Value

Returns a table containing all color values for the specified configuration:

```lua
local colors = require("gruvbox-material.colors").get("dark", "medium")

-- Access colors
print(colors.red)      -- "#ea6962"
print(colors.green)   -- "#a9b665"
print(colors.bg0)     -- "#282828"
```

### Available Colors

#### Base Colors (same for all contrasts)

| Name     | Dark Mode | Light Mode |
| -------- | --------- | ---------- |
| `red`    | #ea6962   | #c14a4a    |
| `orange` | #e78a4e   | #c35e0a    |
| `yellow` | #d8a657   | #b47109    |
| `green`  | #a9b665   | #6c782e    |
| `aqua`   | #89b482   | #4c7a5d    |
| `blue`   | #7daea3   | #45707a    |
| `purple` | #d3869b   | #945e80    |
| `fg0`    | #d4be98   | #654735    |
| `fg1`    | #ddc7a1   | #4f3829    |
| `grey0`  | #7c6f64   | #7c6f64    |
| `grey1`  | #928374   | #928374    |
| `grey2`  | #a89984   | #a89984    |

#### Background Colors (vary by contrast)

| Name               | Description                             |
| ------------------ | --------------------------------------- |
| `bg0`              | Main background                         |
| `bg1`              | Secondary background (sidebars, panels) |
| `bg2`              | Tertiary background                     |
| `bg3`              | Highlighted background                  |
| `bg4`              | Cursor line, fold column                |
| `bg5`              | Statusline, vertical splits             |
| `bg_statusline1`   | Statusline background (mode 1)          |
| `bg_statusline2`   | Statusline background (mode 2)          |
| `bg_statusline3`   | Statusline background (mode 3)          |
| `bg_visual_green`  | Visual mode selection (green)           |
| `bg_visual_red`    | Visual mode selection (red)             |
| `bg_visual_blue`   | Visual mode selection (blue)            |
| `bg_visual_yellow` | Visual mode selection (yellow)          |
| `bg_current_word`  | Current word underline                  |
| `bg_diff_red`      | Diff: deleted                           |
| `bg_diff_green`    | Diff: added                             |
| `bg_diff_blue`     | Diff: changed                           |

### Usage Examples

#### Custom Highlight Groups

```lua
local colors = require("gruvbox-material.colors").get(vim.o.background, "medium")

vim.api.nvim_set_hl(0, "MyCustomGroup", {
  fg = colors.fg0,
  bg = colors.bg1,
  bold = true,
})
```

#### Matching Telescope Colors

```lua
local colors = require("gruvbox-material.colors").get(vim.o.background, "medium")

require("telescope").setup({
  defaults = {
    highlight = {
      Normal = { fg = colors.fg0, bg = colors.bg0 },
      Cursor = { fg = colors.bg0, bg = colors.orange },
    },
  },
})
```

---

## Lualine Theme

This module provides a Lualine-compatible theme.

### Getting the Theme

```lua
local theme = require("gruvbox-material.lualine").theme(contrast)
```

### Parameters

| Parameter  | Type                              | Description        |
| ---------- | --------------------------------- | ------------------ |
| `contrast` | `"hard"`, `"medium"`, or `"soft"` | The contrast level |

### Usage

```lua
local theme = require("gruvbox-material.lualine").theme("medium")

require('lualine').setup {
  options = { theme = theme },
}
```

### Customization

You can further customize the theme after loading it:

```lua
local g_colors = require("gruvbox-material.colors")
local colors = g_colors.get(vim.o.background, "medium")
local theme = require("gruvbox-material.lualine").theme("medium")

-- Customize a specific mode
theme.normal.c = { fg = colors.fg0, bg = colors.bg_statusline1 }

require('lualine').setup {
  options = { theme = theme },
}
```
