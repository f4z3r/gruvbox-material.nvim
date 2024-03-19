# Gruvbox Material Scheme

THIS IS IN DEVELOPEMENT FOR NOW

A port of [gruvbox-material](https://github.com/sainnhe/gruvbox-material) colorscheme for Neovim
written in Lua. Supports both `dark` and `light` themes, based on configured background.

Gruvbox Material is a modified version of Gruvbox, the contrast is adjusted to be softer in order to
protect developers' eyes. Colorscheme supports a lot of new features added to Neovim like built-in
LSP and [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

## ✨ Features

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
  - And many other plugins you can find [here](./lua/gruvbox-material/highlights.lua#L384)

Please feel free to open an issue if you want some features or other plugins to be included.

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install via your favourite package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'f4z3r/gruvbox-material.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'f4z3r/gruvbox-material.nvim'
```

## 🚀 Usage

Load the colors scheme:

Lua:

```lua
require('gruvbox-material').setup()
-- or
vim.cmd('colorscheme gruvbox-material')
```

Vim script:

```vim
colorscheme gruvbox-material
```

## ⚙️ Configuration

This is an example of the function with the default values.

> ❗️ configuration needs to be set **BEFORE** loading the color scheme

| Option                                 | Default | Description          |
| -------------------------------------- | ------- | -------------------- |
| gruvbox_material_enable_italic_comment | `1`     | Make comments italic |

Lua:

```lua
vim.g.gruvbox_material_enable_italic_comment = 1
```

Vim script:

```vim
let g:gruvbox_material_enable_italic_comment = 1
```
