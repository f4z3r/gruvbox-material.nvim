# Changelog

## [Unreleased]

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

[unreleased]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.4...HEAD
[0.1.4]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/f4z3r/gruvbox-material.nvim/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/f4z3r/gruvbox-material.nvim/releases/tag/v0.1.0
