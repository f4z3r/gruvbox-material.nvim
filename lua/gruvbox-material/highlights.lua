local colors = require('gruvbox-material.colors')

local g = vim.g
local opt = vim.opt

highlights = {}

-------------------------------------------------------
-- Custom highlights to be used for other highlights --
-------------------------------------------------------
function highlights.custom()
  local syntax = {
    Fg = { fg = colors.fg0 },
    Grey = { fg = colors.grey1 },
    Red = { fg = colors.red },
    Orange = { fg = colors.orange },
    Yellow = { fg = colors.yellow },
    Green = { fg = colors.green },
    Aqua = { fg = colors.aqua },
    Blue = { fg = colors.blue },
    Purple = { fg = colors.purple },

    CurrentWord = { bg = colors.bg_current_word },

    Error = { link = 'Red' },
    Warning = { link = 'Yellow' },
    Info = { link = 'Blue' },
    Success = { link = 'Green' },
    Hint = { link = 'Green' },

    ErrorFloat = { fg = colors.red, bg = colors.bg3 },
    WarningFloat = { fg = colors.yellow, bg = colors.bg3 },
    InfoFloat = { fg = colors.blue, bg = colors.bg3 },
    HintFloat = { fg = colors.green, bg = colors.bg3 }
  }

  if g.gruvbox_material_diagnostic_text_highlight == 1 then
    syntax.ErrorText = { fg = colors.bg_visual_red, style = 'undercurl' }
    syntax.WarningText = { fg = colors.bg_visual_yellow, style = 'undercurl' }
    syntax.InfoText = { fg = colors.bg_visual_blue, style = 'undercurl' }
    syntax.HintText = { fg = colors.bg_visual_green, style = 'undercurl' }
  else
    syntax.ErrorText = { style = 'undercurl' }
    syntax.WarningText = { style = 'undercurl' }
    syntax.InfoText = { style = 'undercurl' }
    syntax.HintText = { style = 'undercurl' }
  end

  if g.gruvbox_material_diagnostic_line_highlight == 1 then
    syntax.ErrorLine = { fg = colors.bg_visual_red }
    syntax.WarningLine = { fg = colors.bg_visual_yellow }
    syntax.InfoLine = { fg = colors.bg_visual_blue }
    syntax.HintLine = { fg = colors.bg_visual_green }
  else
    vim.cmd('highlight clear ErrorLine')
    vim.cmd('highlight clear WarningLine')
    vim.cmd('highlight clear InfoLine')
    vim.cmd('highlight clear HintLine')
  end

  if g.gruvbox_material_diagnostic_virtual_text == 'grey' then
    syntax.VirtualTextError = { link = 'Grey' }
    syntax.VirtualTextWarning = { link = 'Grey' }
    syntax.VirtualTextInfo = { link = 'Grey' }
    syntax.VirtualTextHint = { link = 'Grey' }
  else
    syntax.VirtualTextError = { link = 'Error' }
    syntax.VirtualTextWarning = { link = 'Warning' }
    syntax.VirtualTextInfo = { link = 'Info' }
    syntax.VirtualTextHint = { link = 'Hint' }
  end

  if g.transparent_background == 1 or g.sign_column_background ~= 'default' then
    syntax.RedSign = { fg = colors.red }
    syntax.OrangeSign = { fg = colors.orange }
    syntax.YellowSign = { fg = colors.yellow }
    syntax.GreenSign = { fg = colors.green }
    syntax.AquaSign = { fg = colors.aqua }
    syntax.BlueSign = { fg = colors.blue }
    syntax.PurpleSign = { fg = colors.purple }
  else
    syntax.RedSign = { fg = colors.red, bg = colors.bg2 }
    syntax.OrangeSign = { fg = colors.orange, bg = colors.bg2 }
    syntax.YellowSign = { fg = colors.yellow, bg = colors.bg2 }
    syntax.GreenSign = { fg = colors.green, bg = colors.bg2 }
    syntax.AquaSign = { fg = colors.aqua, bg = colors.bg2 }
    syntax.BlueSign = { fg = colors.blue, bg = colors.bg2 }
    syntax.PurpleSign = { fg = colors.purple, bg = colors.bg2 }
  end

  return syntax
end

-----------------------
-- Editor highlights --
-----------------------
function highlights.syntax()
  local syntax = {
    Type = { fg = colors.yellow }, -- int, long, char, etc.
    Typedef = { fg = colors.red }, -- A typedef
    StorageClass = { fg = colors.orange }, -- static, register, volatile, etc.
    Structure = { fg = colors.orange }, -- struct, union, enum, etc.
    Constant = { fg = colors.aqua }, -- any constant
    Character = { fg = colors.green }, -- any character constant: 'c', '\n'
    Number = { fg = colors.purple }, -- a number constant: 5
    Boolean = { fg = colors.purple }, -- a boolean constant: TRUE, false
    Float = { fg = colors.purple }, -- a floating point constant: 2.3e10
    Statement = { fg = colors.red }, -- any statement
    Label = { fg = colors.orange }, -- case, default, etc.
    Operator = { fg = colors.orange }, -- sizeof", "+", "*", etc.
    Exception = { fg = colors.red }, -- try, catch, throw
    PreProc = { fg = colors.purple }, -- generic Preprocessor
    Include = { fg = colors.purple }, -- preprocessor #include
    Define = { fg = colors.purple }, -- preprocessor #define
    Identifier = { fg = colors.blue },
    Macro = { fg = colors.aqua }, -- same as Define
    PreCondit = { fg = colors.purple }, -- preprocessor #if, #else, #endif, etc.
    Special = { fg = colors.yellow }, -- any special symbol
    SpecialChar = { fg = colors.yellow }, -- special character in a constant
    Function = { fg = colors.green }, -- special character in a constant
    Tag = { fg = colors.orange }, -- you can use CTRL-] on this
    Delimiter = { fg = colors.fg0 }, -- character that needs attention like , or .
    QuickFixLine = { fg = colors.purple, style = 'bold' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Debug = { fg = colors.orange }, -- debugging statements
    debucPC = { fg = colors.bg0, bg = colors.green }, -- the current position
    debugBreakpoint = { fg = colors.bg0 }, -- a breakpoint
    ToolbarLine = { fg = colors.fg1, bg = colors.bg3 },
    ToolbarButton = { fg = colors.fg0, bg = colors.grey2 },
    Underlined = { fg = colors.blue, style = 'underline' }, -- text that stands out, HTML links
    Ignore = { fg = colors.grey1 } -- left blank, hidden
  }

  if g.gruvbox_material_enable_italic_comment == 1 then
    syntax.Comment = { fg = colors.grey1, style = 'italic' } -- any comments
    syntax.SpecialComment = { fg = colors.grey1, style = 'italic' } -- special things inside a comment
    syntax.Todo = { fg = colors.purple, style = 'italic' } -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  else
    syntax.Comment = { fg = colors.grey1 }
    syntax.SpecialComment = { fg = colors.grey1 }
    syntax.Todo = { fg = colors.purple }
  end

  return syntax
end

--------------------------------------------------------------------------------
-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`) --
--------------------------------------------------------------------------------
function highlights.highlight_groups()
  local syntax = {
    ColorColumn = { bg = colors.bg2 }, --  used for the columns set with 'colorcolumn'
    Conceal = { bg = colors.bg5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')

    Cursor = { style = 'reverse' }, -- the character under the cursor
    lCursor = { link = 'Cursor' }, -- the character under the cursor
    CursorIM = { link = 'Cursor' },

    CursorLine = { bg = colors.bg1 },
    CursorColumn = { bg = colors.bg1 },
    CursorLineNr = { fg = colors.grey1 },

    -- Diff mode
    DiffAdd = { bg = colors.bg_diff_green }, -- Added line
    DiffChange = { bg = colors.bg_diff_blue }, --  Changed line
    DiffDelete = { bg = colors.bg_diff_red }, -- Deleted line
    DiffText = { fg = colors.bg0, bg = colors.blue }, -- Changed text within a changed line

    EndOfBuffer = { fg = colors.bg5, bg = colors.bg0 }, -- filler lines (~) after the last line in the buffer

    VertSplit = { fg = colors.bg5 }, -- the column separating verti-- cally split windows

    Directory = { fg = colors.green }, -- directory names (and other special names in listings)
    Folded = { fg = colors.grey1, bg = colors.bg2 }, -- line used for closed folds
    FoldColumn = { fg = colors.grey1 },
    SignColumn = { fg = colors.fg0 }, -- column where signs are displayed

    IncSearch = { fg = colors.bg0, bg = colors.bg_red }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Search = { fg = colors.bg0, bg = colors.bg_green }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    LineNr = { fg = colors.bg5 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.

    ErrorMsg = { link = 'Error' }, -- error messages on the command line
    WarningMsg = { fg = colors.yellow, style = 'bold' }, --  warning messages
    ModeMsg = { fg = colors.fg0, style = 'bold' }, -- 'showmode' message (e.g., "-- INSERT --")
    MoreMsg = { fg = colors.yellow, style = 'bold' }, -- more-prompt
    MatchParen = { bg = colors.bg4 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    NonText = { fg = colors.bg5 }, -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    Whitespace = { fg = colors.bg5 }, -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    SpecialKey = { fg = colors.bg5 }, -- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    Title = { fg = colors.orange, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.

    -- Popup menu
    Pmenu = { fg = colors.fg1, bg = colors.bg3 }, -- normal item
    PmenuSel = { fg = colors.bg3, bg = colors.grey2 }, -- selected item
    PmenuSbar = { bg = colors.bg3 }, -- scrollbar
    PmenuThumb = { bg = colors.grey0 }, -- Thumb of the scrollbar

    Normal = { fg = colors.fg0, bg = colors.bg0 }, -- normal text
    NormalFloat = { fg = colors.fg1, bg = colors.bg3 },

    Question = { fg = colors.yellow }, -- hit-enter prompt and yes/no questions

    SpellBad = { style = 'undercurl' }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    SpellCap = { style = 'undercurl' }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    SpellLocal = { style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    SpellRare = { style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.

    StatusLine = { fg = colors.fg1, bg = colors.bg_statusline1 }, -- status line of current window
    StatusLineTerm = { link = 'StatusLine' }, -- status line of current :terminal window
    StatusLineNC = { fg = colors.fg1, bg = colors.bg_statusline1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTermNC = { link = 'StatusLineNC' }, -- status line of non-current :terminal window
    TabLine = { fg = colors.fg1, bg = colors.bg_statusline3 },
    TabLineFill = { fg = colors.fg1, bg = colors.bg_statusline1 },
    TabLineSel = { fg = colors.bg0, bg = colors.grey2 },

    Visual = { bg = colors.bg3 }, -- Visual mode selection
    VisualNOS = { link = 'Visual' }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    WildMenu = { link = 'PmenuSel' }, --  current match in 'wildmenu' completion

    -- ----------------------
    -- Specific for neovim --
    -- ----------------------

    -- LSP Groups (descriptions and ordering from `:h lsp-highlight`)
    LspDiagnosticsDefaultError = { link = 'ErrorText' }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsDefaultHint = { link = 'HintText' }, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsDefaultInformation = { link = 'InfoText' }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsDefaultWarning = { link = 'WarningText' }, -- used for "Warning" diagnostic signs in sign column

    LspDiagnosticsSignError = { link = 'RedSign' }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsSignHint = { link = 'AquaSign' }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsSignInformation = { link = 'BlueSign' }, -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { link = 'YellowSign' }, -- used for "Warning" diagnostic signs in sign column

    LspDiagnosticsFloatingError = { link = 'ErrorFloat' }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingHint = { link = 'HintFloat' }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingInformation = { link = 'InfoFloat' }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingWarning = { link = 'WarningFloat' }, -- used for "Warning" diagnostic messages in the diagnostics float

    LspDiagnosticsVirtualTextError = { link = 'VirtualTextError' }, -- Virtual text "Error"
    LspDiagnosticsVirtualTextHint = { link = 'VirtualTextHint' }, -- Virtual text "Hint"
    LspDiagnosticsVirtualTextInformation = { link = 'VirtualTextInfo' }, -- Virtual text "Information"
    LspDiagnosticsVirtualTextWarning = { link = 'VirtualTextWarning' }, -- Virtual text "Warning"

    LspDiagnosticsUnderlineError = { link = 'ErrorText' }, -- used to underline "Error" diagnostics.
    LspDiagnosticsUnderlineHint = { link = 'HintText' }, -- used to underline "Hint" diagnostics.
    LspDiagnosticsUnderlineInformation = { link = 'InfoText' }, -- used to underline "Information" diagnostics.
    LspDiagnosticsUnderlineWarning = { link = 'WarningText' }, -- used to underline "Warning" diagnostics.

    LspReferenceRead = { link = 'CurrentWord' }, -- used for highlighting "read" references
    LspReferenceText = { link = 'CurrentWord' }, -- used for highlighting "text" references
    LspReferenceWrite = { link = 'CurrentWord' }, -- used for highlighting "write" references

    TermCursor = { link = 'Cursor' },
    healthError = { link = 'Error' },
    healthSuccess = { link = 'Success' },
    healthWarning = { link = 'Warning' },
  }

  return syntax
end

-- TODO: Create colorscheme for terminal
function highlights.terminal()
end

function highlights.filetype_specific()
  local syntax = {
    -- markdown
    markdownH1 = { fg = colors.red, style = 'bold' },
    markdownH2 = { fg = colors.orange, style = 'bold' },
    markdownH3 = { fg = colors.yellow, style = 'bold' },
    markdownH4 = { fg = colors.green, style = 'bold' },
    markdownH5 = { fg = colors.blue, stlye = 'bold' },
    markdownH6 = { fg = colors.purple, style = 'bold' },
    markdownUrl = { fg = colors.blue, style = 'italic' },
    markdownItalic = { style = 'italic' },
    markdownBold = { style = 'bold' },
    markdownItalicDelimiter = { fg = colors.grey1, style = 'italic' },

    -- ruby
    rubyKeywordAsMethod = { link = 'Green' },
    rubyInterpolation = { link = 'Yellow' },
    rubyInterpolationDelimiter = { link = 'Yellow' },
    rubyStringDelimiter = { link = 'Green' },
    rubyBlockParameterList = { link = 'Blue' },
    rubyDefine = { link = 'Red' },
    rubyModuleName = { link = 'Purple' },
    rubyAccess = { link = 'Orange' },
    rubyAttribute = { link = 'Yellow' },
    rubyMacro = { link = 'Red' },

    -- python
    pythonBuiltin = { link = 'Yellow' },
    pythonExceptions = { link = 'Purple' },
    pythonDecoratorName = { link = 'Blue' },

    -- php
    phpVarSelector = { link = 'Blue' },
    phpDefine = { link = 'Orange' },
    phpStructure = { link = 'Red' },
    phpSpecialFunction = { link = 'Green' },
    phpInterpSimpleCurly = { link = 'Yellow' },
    phpComparison = { link = 'Orange' },
    phpMethodsVar = { link = 'Aqua' },
    phpMemberSelector = { link = 'Aqua' },

    -- matlab
    matlabSemicolon = { link = 'Fg' },
    matlabFunction = { link = 'Red' },
    matlabImplicit = { link = 'Green' },
    matlabDelimiter = { link = 'Fg' },
    matlabOperator = { link = 'Green' },
    matlabArithmeticOperator = { link = 'Orange' },
    matlabRelationalOperator = { link = 'Orange' },
    matlabLogicalOperator = { link = 'Orange' },

    -- json
    jsonKeyword = { link = 'Orange' },
    jsonQuote = { link = 'Grey' },
    jsonBraces = { link = 'Fg' },

    -- yaml
    yamlKey = { link = 'Orange' },
    yamlConstant = { link = 'Purple' },

    -- toml
    tomlTable = { fg = colors.purple, style = 'bold' },
    tomlKey = { link = 'Orange' },
    tomlBoolean = { link = 'Aqua' },
    tomlTableArray = { link = 'tomlTable' },

    -- make
    makeIdent = { link = 'Aqua' },
    makeSpecTarget = { link = 'Yellow' },
    makeTarget = { link = 'Blue' },
    makeCommands = { link = 'Orange' },

    -- help
    helpNote = { fg = colors.purple, style = 'bold' },
    helpHeadline = { fg = colors.red, style = 'bold' },
    helpHeader = { fg = colors.orange, style = 'bold' },
    helpURL = { fg = colors.green, style = 'underline' },
    helpHyperTextEntry = { fg = colors.yellow, style = 'bold' },
    helpHyperTextJump = { link = 'Yellow' },
    helpCommand = { link = 'Aqua' },
    helpExample = { link = 'Green' },
    helpSpecial = { link = 'Blue' },
    helpSectionDelim = { link = 'Grey' },

    -- gitcommit
    gitcommitSummary = { link = 'Red' },
    gitcommitUntracked = { link = 'Grey' },
    gitcommitDiscarded = { link = 'Grey' },
    gitcommitSelected = { link = 'Grey' },
    gitcommitUnmerged = { link = 'Grey' },
    gitcommitOnBranch = { link = 'Grey' },
    gitcommitArrow = { link = 'Grey' },
    gitcommitFile = { link = 'Green' },

    -- diff
    diffAdded = { link = 'Green' },
    diffRemoved = { link = 'Red' },
    diffChanged = { link = 'Blue' },
    diffOldFile = { link = 'Yellow' },
    diffNewFile = { link = 'Orange' },
    diffFile = { link = 'Aqua' },
    diffLine = { link = 'Grey' },
    diffIndexLine = { link = 'Purple' }

  }

  return syntax
end

-- TODO: Add more description.
-----------------------------------
-- Tresitter specific highlights --
-- :h nvim-treesitter-highlights --
-----------------------------------
function highlights.treesitter()
  local syntax = {
    TSAnnotation = { link = 'Purple' }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = { link = 'Purple' },
    TSBold = { style = 'bold' },
    TSBoolean = { link = 'Purple' }, -- For booleans.
    TSCharacter = { link = 'Aqua' }, -- For characters.
    TSComment = { link = 'Comment' },
    TSConditional = { link = 'Red' },
    TSConstBuiltin = { link = 'Blue' }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro = { link = 'Blue' }, -- For constants that are defined by macros: `NULL` in C.
    TSConstant = { link = 'Fg' }, -- For constants
    TSConstructor = { link = 'Green' }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSDanger = { fg = colors.bg0, bg = colors.red, style = 'bold' },
    TSEmphasis = { style = 'bold' },
    TSError = { link = 'Error' }, -- For syntax/parser errors.
    TSException = { link = 'Red' }, -- For exception related keywords.
    TSField = { link = 'Green' }, -- For fields.
    TSFloat = { link = 'Purple' }, -- For floats.
    TSFuncBuiltin = { link = 'Green' },
    TSFuncMacro = { link = 'Green' }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSFunction = { link = 'Green' },
    TSInclude = { link = 'Red' }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { link = 'Red' },
    TSKeywordFunction = { link = 'Red' },
    TSKeywordOperator = { link = 'Orange' },
    TSLabel = { link = 'Orange' }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMath = { fg = 'Blue' },
    TSMethod = { link = 'Green' },
    TSNamespace = { link = 'Yellow' }, -- For identifiers referring to modules and namespaces.
    TSNone = { link = 'Fg' },
    TSNumber = { link = 'Purple' }, -- For all numbers
    TSOperator = { link = 'Orange' }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { link = 'Fg' }, -- For parameters of a function.
    TSParameterReference = { link = 'Fg' }, -- For references to parameters of a function.
    TSProperty = { link = 'Green' }, -- Same as `TSField`,accesing for struct members in C.
    TSPunctBracket = { link = 'Fg' }, -- For brackets and parens.
    TSPunctDelimiter = { link = 'Grey' }, -- For delimiters ie: `.`
    TSPunctSpecial = { link = 'Blue' }, -- For special punctutation that does not fall in the catagories before.
    TSRepeat = { link = 'Red' },
    TSStrike = { link = 'Grey' }, -- For strikethrough text.
    TSString = { link = 'Aqua' },
    TSStringEscape = { link = 'Green' }, -- For escape characters within a string.
    TSStringRegex = { link = 'Green' }, -- For regexes.
    TSStroung = { style = 'bold' },
    TSStructure = { link = 'Blue' },
    TSSymbol = { link = 'Fg' }, -- For identifiers referring to symbols or atoms.
    TSTag = { link = 'Orange' }, -- Tags like html tag names.
    TSTagDelimiter = { link = 'Green' }, -- Tag delimiter like `<` `>` `/`
    TSText = { link = 'Green' }, -- For strings considered text in a markup language.
    TSType = { link = 'Yellow' }, -- For types.
    TSTypeBuiltin = { link = 'Yellow' }, -- For builtin types.
    TSURI = { link = 'markdownUrl' }, -- Any URI like a link or email.
    TSUnderline = { style = 'underline' },
    TSVariable = { link = 'Fg' },
    TSVariableBuiltin = { link = 'Blue' }
  }

  return syntax
end

function highlights.plugin_specific()
  local syntax = {
    -- nvim-telescope/telescope.nvim
    TelescopeBorder = { link = 'Grey' },
    TelescopeMatching = { fg = colors.green, style = 'bold' },
    TelescopePromptPrefix = { link = 'Orange' },
    TelescopeSelection = { link = 'DiffAdd' },

    -- preservim/nerdtree 
    NERDTreeCWD = { link = 'Aqua' },
    NERDTreeClosable = { link = 'Orange' },
    NERDTreeDir = { link = 'Green' },
    NERDTreeDirSlash = { link = 'Aqua' },
    NERDTreeExecFile = { link = 'Yellow' },
    NERDTreeFile = { link = 'Fg' },
    NERDTreeFlags = { link = 'Orange' },
    NERDTreeHelp = { link = 'Grey' },
    NERDTreeLinkFile = { link = 'Grey' },
    NERDTreeLinkTarget = { link = 'Green' },
    NERDTreeOpenable = { link = 'Orange' },
    NERDTreeToggleOff = { link = 'Red' },
    NERDTreeToggleOn = { link = 'Green' },
    NERDTreeUp = { link = 'Grey' },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { link = 'Green' },
    NvimTreeExecFile = { link = 'Fg' },
    NvimTreeFolderIcon = { link = 'Orange' },
    NvimTreeFolderName = { link = 'Green' },
    NvimTreeGitDeleted = { link = 'Red' },
    NvimTreeGitDirty = { link = 'Yellow' },
    NvimTreeGitMerge = { link = 'Orange' },
    NvimTreeGitNew = { link = 'Aqua' },
    NvimTreeGitRenamed = { link = 'Purple' },
    NvimTreeGitStaged = { link = 'Blue' },
    NvimTreeImageFile = { link = 'Fg' },
    NvimTreeIndentMarker = { link = 'Grey' },
    NvimTreeMarkdownFile = { link = 'Fg' },
    NvimTreeOpenedFile = { link = 'Fg' },
    NvimTreeOpenedFolderName = { link = 'Green' },
    NvimTreeRootFolder = { link = 'Grey' },
    NvimTreeSpecialFile = { link = 'Fg' },
    NvimTreeSymlink = { link = 'Fg' },

    -- mhinz/vim-startify
    StartifyBracket = { link = 'Grey' },
    StartifyFile = { link = 'Fg' },
    StartifyFooter = { link = 'Grey' },
    StartifyHeader = { link = 'Orange' },
    StartifyNumber = { link = 'Red' },
    StartifyPath = { link = 'Green' },
    StartifySection = { link = 'Blue' },
    StartifySlash = { link = 'Green' },
    StartifySpecial = { link = 'Grey' },

    -- mbbill/undotree
    UndotreeBranch = { link = 'Yellow' },
    UndotreeCurrent = { link = 'Aqua' },
    UndotreeHead = { link = 'Yellow' },
    UndotreeNext = { link = 'Blue' },
    UndotreeNode = { link = 'Orange' },
    UndotreeNodeCurrent = { link = 'Red' },
    UndotreeSavedBig = { fg = colors.purple, style = 'bold' },
    UndotreeSavedSmall = { link = 'Purple' },
    UndotreeSeq = { link = 'Green' },
    UndotreeTimeStamp = { link = 'Grey' },

    -- liuchengxu/vista.vim
    VistaBracket = { link = 'Grey' },
    VistachildrenNr = { link = 'Orange' },
    VistaScope = { link = 'Red' },
    VistaTag = { link = 'Green' },
    VistaPrefix = { link = 'Grey' },
    VistaIcon = { link = 'Orange' },
    VistaScopeKind = { link = 'Yellow' },
    VistaColon = { link = 'Grey' },
    VistaLineNr = { link = 'Grey' },
    VistaHeadNr = { link = 'Fg' },
    VistaPublic = { link = 'Green' },
    VistaProtected = { link = 'Yellow' },
    VistaPrivate = { link = 'Red' },

    -- airblade/vim-gitgutter
    GitGutterAdd = { link = 'GreenSign' },
    GitGutterChange = { link = 'BlueSign' },
    GitGutterDelete = { link = 'RedSign' },
    GitGutterChangeDelete = { link = 'PurpleSign' },

    -- mhinz/vim-signify
    SignifySignAdd = { link = 'GreenSign' },
    SignifySignChange = { link = 'BlueSign' },
    SignifySignDelete = { link = 'RedSign' },
    SignifySignChangeDelete = { link = 'PurpleSign' },

    -- phaazon/hop.nvim
    HopNextKey = { fg = colors.orange, style = 'bold' },
    HopNextKey1 = { fg = colors.green, style = 'bold' },
    HopNextKey2 = { link = 'Green' },
    HopUnmatched = { link = 'Grey' },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineContextChar = { link = 'CursorLineNr' },
    IndentBlanklineChar = { link = 'LineNr' },
    IndentBlanklineSpaceChar = { link = 'LineNr' },
    IndentBlanklineSpaceCharBlankline = { link = 'LineNr' },

    -- liuchengxu/vim-which-key
    WhichKey = { link = 'Red' },
    WhichKeySeperator = { link = 'Green' },
    WhichKeyGroup = { link = 'Yellow' },
    WhichKeyDesc = { link = 'Blue' },

    -- p00f/nvim-ts-rainbow
    rainbowcol1 = { link = 'Red' },
    rainbowcol2 = { link = 'Orange' },
    rainbowcol3 = { link = 'Yellow' },
    rainbowcol4 = { link = 'Green' },
    rainbowcol5 = { link = 'Aqua' },
    rainbowcol6 = { link = 'Blue' },
    rainbowcol7 = { link = 'Purple' },

    -- vim-syntastic/syntastic
    SyntasticError = { link = 'ErrorText' },
    SyntasticWarning = { link = 'WarningText' },
    SyntasticErrorSign = { link = 'RedSign' },
    SyntasticWarningSign = { link = 'YellowSign' },
    SyntasticErrorLine = { link = 'ErrorLine' },
    SyntasticWarningLine = { link = 'warningline' },

    -- junegunn/vim-plug
    plug1 = { fg = colors.orange, style = 'bold' },
    plugNumber = {fg = colors.yellow, style = 'bold'},
    plug2 = { link = 'Green' },
    plugBracket = { link = 'Grey' },
    plugName = { link = 'Aqua' },
    plugDash = { link = 'Orange' },
    plugError = { link = 'Red' },
    plugNotLoaded = { link = 'Grey' },
    plugRelDate = { link = 'Grey' },
    plugH2 = { link = 'Orange' },
    plugMessage = { link = 'Orange' },
    plugStar = { link = 'Red' },
    plugUpdate = { link = 'Blue' },
    plugDeleted = { link = 'Grey' },
    plugEdge = { link = 'Yellow' },
    plugSha = { link = 'Green' }
  }

  -- Yggdroot/indentLine
  g.indentLine_color_gui = colors.bg5
  g.indentLine_color_term = colors.term.bg5

  -- mg979/vim-visual-multi
  g.VM_Cursor_hl = 'Cursor'
  g.VM_Extend_hl = 'Visual'
  g.VM_Insert_hl = 'Cursor'
  g.VM_Mono_hl = 'Cursor'

  return syntax
end

return highlights

-- TODO:
-- 1. Need to add fzf.vim but config for this plugin wrote in vim, how to convert it for lua?

