# Changelog

## [Unreleased]

### Added

- Add support for
  [`visual-whitespace.nvim`](https://github.com/mcauley-penney/visual-whitespace.nvim).
- Add highlight group [`WinSeparator`](https://neovim.io/doc/user/syntax.html#hl-WinSeparator) which replaces `VertSplit` in newer versions of Neovim.
- Add highlight group [`FloatBorder`](https://neovim.io/doc/user/syntax.html#hl-FloatBorder) (linked to [`WinSeparator`](https://neovim.io/doc/user/syntax.html#hl-WinSeparator)).

## [1.7.0] - 2025-07-06

### Added

- Support easy update for sign background colors using `signs.background_color` configuration option.

### Removed

- Deprecated `signs.highlight` in favour of `signs.force_background`. `signs.highlight` option
  **will be removed** in a future release.

## [1.6.0] - 2025-03-28

### Fixed

- Improve pop-up menu support to ensure consistent background colour usage.

### Added

- Support for `blink.cmp`.
- Support for Navic.
- Improved support for Trouble.

## [1.5.0] - 2025-03-06

### Added

- Support for Lualine theme.

## [1.4.1] - 2024-09-26

### Changed

- Subsequent calls to `setup` take a cached configuration and require explicit override to unset.

### Fixed

- Update light bg4 and statusline bg3 colour on hard contrast to have the correct value.

## [1.4.0] - 2024-08-16

### Changed

- Add better support for [neorg](https://github.com/nvim-neorg/neorg)
- Add better support for [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim/)

## [1.3.1] - 2024-08-05

### Changed

- Allow signs background configuration independently of regular background.

### Added

- Added `CurSearch` and `NormalNC` highlight groups.

## [1.3.0] - 2024-05-22

### Added

- Support for customizing the theme via a simple callback.

### Changed

- Change `DiagnosticUnnecessary` color from yellow to gray.

### Removed

- Configuration via global variables.

## [1.2.0] - 2024-05-11

### Added

- Support for hard and soft contrast.
- Support for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Support for [vim-illuminate](https://github.com/RRethy/vim-illuminate)

## [1.1.0] - 2024-05-10

### Added

- Support for [nvim-notify](https://github.com/rcarriga/nvim-notify)
- Support for Neovim's Diagnostic highlights.

### Fixed

- Change foreground color for non-current statusline highlight group.
- Change undercurl colors for spelling.

## [1.0.0] - 2024-05-05

### Added

- Allow to force a background for floating windows even if the normal background is transparent.
- Allow to explicitly set the background color of floating windows.

### Changed

- Full refactor of the code to simplify future changes.
- Update to the configuration to be more "lua-like".

### Deprecated

- Configuration via global variables.

## [0.1.4] - 2024-04-25

### Fixed

- Fix plugin load to allow using dynamic background settings to configure theme.

## [0.1.3] - 2024-04-07

### Fixed

- Fix `gruvbox_material_transparent_background` to only make base background transparent.

## [0.1.2] - 2024-04-01

### Fixed

- Fix support for `gruvbox_material_transparent_background`.

## [0.1.1] - 2024-03-24

### Added

- Docstrings that are actual strings (such as in Python) are now rendered like comments.
- `TODO`/`NOTE`/`FIX`/`BUG`/... within comments are rendered according to warning levels.
- Code styling and linting with Stylua and Selene.

### Fixed

- Updates to [tree-sitter capture names](https://github.com/nvim-treesitter/nvim-treesitter/issues/2293#issuecomment-1900679583)

## [0.1.0] - 2024-03-20

Initial version from [WittyJudge](https://github.com/WIttyJudge).

[unreleased]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.7.0...HEAD
[1.7.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.6.0...v1.7.0
[1.6.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.5.0...v1.6.0
[1.5.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.4.1...v1.5.0
[1.4.1]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.3.1...v1.4.0
[1.3.1]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.4...v1.0.0
[0.1.4]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/f4z3r/gruvbox-material.nvim/releases/tag/v0.1.0
