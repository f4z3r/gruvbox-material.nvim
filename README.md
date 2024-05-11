# Gruvbox Material Scheme

> [!NOTE]
> This is a continuation of the original work from WittyJudge:
> https://github.com/WIttyJudge/gruvbox-material.nvim

A port of [gruvbox-material](https://github.com/sainnhe/gruvbox-material) colorscheme for Neovim
written in Lua. It does not aim to be 100% compatible with the mentioned repository, but rather
focuses on keeping the existing scheme stable and to support popular plugins. This colorscheme
supports both `dark` and `light` themes, based on configured background.

**Dark theme:**
![](./assets/dark.jpg)

**Light theme:**
![](./assets/light.jpg)

---

**Table of Contents:**

<!--toc:start-->
- [Gruvbox Material Scheme](#gruvbox-material-scheme)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage and Configuration](#usage-and-configuration)
<!--toc:end-->

---

## Features

- Supported Plugins:
  - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  - [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
  - [Nvim Tree](https://github.com/kyazdani42/nvim-tree.lua)
  - [NERDTree](https://github.com/preservim/nerdtree)
  - [Startify](https://github.com/mhinz/vim-startify)
  - [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
  - [undotree](https://github.com/mbbill/undotree)
  - [Vista.vim](https://github.com/liuchengxu/vista.vim)
  - [Hop](https://github.com/phaazon/hop.nvim)
  - [WhichKey](https://github.com/liuchengxu/vim-which-key)
  - [indentLine](https://github.com/Yggdroot/indentLine)
  - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
  - [nvim-notify](https://github.com/rcarriga/nvim-notify)
  - And many other plugins you can find [here](./lua/gruvbox-material/highlights.lua#L384)

Please feel free to open an issue if you want some features or other plugins to be included.

## Installation

> [!NOTE]
> This plugin requires Neovim >= 0.5.0

Install via your favourite package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'f4z3r/gruvbox-material.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'f4z3r/gruvbox-material.nvim'
```

[lazy](https://github.com/folke/lazy.nvim)


```lua
{
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
  opts = {},
},
```

## Usage and Configuration

Load the color scheme and define the desired options:

```lua
-- values shown are defaults and will be used if not provided
require('gruvbox-material').setup({
  italics = true,             -- enable italics in general
  contrast = "medium"         -- set contrast, can be any of "hard", "medium", "soft"
  comments = {
    italics = true,           -- enable italic comments
  },
  background = {
    transparent = false,      -- set the background to transparent
  },
  float = {
    force_background = false, -- force background on floats even when background.transparent is set
    background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
                              -- by the color scheme
  }
})
```
