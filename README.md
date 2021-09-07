# Gruvbox Material Scheme

THIS IS IN DEVELOPEMENT FOR NOW

A port of [gruvbox-material](https://github.com/sainnhe/gruvbox-material) colorscheme for Neovim written in Lua.

Gruvbox Material is a modified version of Gruvbox, the contrast is adjusted to be softer in order to protect developers' eyes. Colorscheme supports a lot of new features added to Neovim like built-in LSP and [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

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
  - And many other plugins you can find [here](https://github.com/WIttyJudge/gruvbox-material.nvim/blob/master/lua/gruvbox-material/highlights.lua#L440)
  
Please feel free to open an issue if you want some features or other plugins to be included.

## Install

Install via your favourite package manager:

Vim-plug:

```
Plug 'wittyjudge/gruvbox-material.nvim'
```

Packer:

```
use 'wittyjudge/gruvbox-material.nvim'
```

## Usage

Enable the colorscheme:

Lua:

```
require('gruvbox-material').setup()
```

Vim script:

```
colorscheme gruvbox-material
```

## Configuration

This is an example of the function with the default values.


Lua:

```
vim.g.gruvbox_material_enable_italic_comment = 1

require('gruvbox-material').setup()

```

Vim script:

```
let g:gruvbox_material_enable_italic_comment = 1

colorscheme gruvbox-material
```
