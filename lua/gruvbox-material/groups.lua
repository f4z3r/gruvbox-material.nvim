local utils = require("gruvbox-material.utils")

local groups = {}

---get highlight groups
---@param contrast Contrast
---@return table
function groups.get(contrast)
  local g_colors = require("gruvbox-material.colors")
  local colors = g_colors.get(vim.o.background, contrast)

  -- set globals for vim compatibility
  local g = vim.g
  -- Yggdroot/indentLine
  g.indentLine_color_gui = colors.bg5
  g.indentLine_color_term = colors.term.bg5

  -- mg979/vim-visual-multi
  g.VM_Cursor_hl = "Cursor"
  g.VM_Extend_hl = "Visual"
  g.VM_Insert_hl = "Cursor"
  g.VM_Mono_hl = "Cursor"

  return {
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

    Error = { link = "Red" },
    Warning = { link = "Yellow" },
    Info = { link = "Blue" },
    Success = { link = "Green" },
    Hint = { link = "Green" },

    ErrorFloat = { fg = colors.red, bg = colors.bg3 },
    WarningFloat = { fg = colors.yellow, bg = colors.bg3 },
    InfoFloat = { fg = colors.blue, bg = colors.bg3 },
    HintFloat = { fg = colors.green, bg = colors.bg3 },

    ErrorText = { fg = colors.bg_visual_red, undercurl = true },
    WarningText = { fg = colors.bg_visual_yellow, undercurl = true },
    InfoText = { fg = colors.bg_visual_blue, undercurl = true },
    HintText = { fg = colors.bg_visual_green, undercurl = true },

    -- ErrorLine = { fg = colors.bg_visual_red }
    -- WarningLine = { fg = colors.bg_visual_yellow }
    -- InfoLine = { fg = colors.bg_visual_blue }
    -- HintLine = { fg = colors.bg_visual_green }

    VirtualTextError = { link = "Error" },
    VirtualTextWarning = { link = "Warning" },
    VirtualTextInfo = { link = "Info" },
    VirtualTextHint = { link = "Hint" },

    RedSign = { fg = colors.red, bg = colors.bg2 },
    OrangeSign = { fg = colors.orange, bg = colors.bg2 },
    YellowSign = { fg = colors.yellow, bg = colors.bg2 },
    GreenSign = { fg = colors.green, bg = colors.bg2 },
    AquaSign = { fg = colors.aqua, bg = colors.bg2 },
    BlueSign = { fg = colors.blue, bg = colors.bg2 },
    PurpleSign = { fg = colors.purple, bg = colors.bg2 },

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
    QuickFixLine = { fg = colors.purple, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Debug = { fg = colors.orange }, -- debugging statements
    debucPC = { fg = colors.bg0, bg = colors.green }, -- the current position
    debugBreakpoint = { fg = colors.bg0 }, -- a breakpoint
    ToolbarLine = { fg = colors.fg1, bg = colors.bg3 },
    ToolbarButton = { fg = colors.fg0, bg = colors.grey2 },
    Underlined = { fg = colors.blue, underline = true }, -- text that stands out, HTML links
    Ignore = { fg = colors.grey1 }, -- left blank, hidden

    Comment = { fg = colors.grey1, italic = true }, -- any comments
    SpecialComment = { fg = colors.grey1, italic = true }, -- special things inside a comment
    Todo = { fg = colors.purple, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    ColorColumn = { bg = colors.bg2 }, --  used for the columns set with 'colorcolumn'
    Conceal = { bg = colors.bg5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')

    Cursor = { reverse = true }, -- the character under the cursor
    lCursor = { link = "Cursor" }, -- the character under the cursor
    CursorIM = { link = "Cursor" },

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
    CurSearch = { link = "Search" }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    LineNr = { fg = colors.bg5 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.

    ErrorMsg = { link = "Error" }, -- error messages on the command line
    WarningMsg = { fg = colors.yellow, bold = true }, --  warning messages
    ModeMsg = { fg = colors.fg0, bold = true }, -- 'showmode' message (e.g., "-- INSERT --")
    MoreMsg = { fg = colors.yellow, bold = true }, -- more-prompt
    MatchParen = { bg = colors.bg4 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    NonText = { fg = colors.bg5 }, -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    Whitespace = { fg = colors.bg5 }, -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    SpecialKey = { fg = colors.bg5 }, -- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    Title = { fg = colors.orange, bold = true }, -- titles for output from ":set all", ":autocmd" etc.

    -- Popup menu
    Pmenu = { fg = colors.fg1, bg = colors.bg3 }, -- normal item
    PmenuSel = { fg = colors.bg3, bg = colors.grey2 }, -- selected item
    PmenuSbar = { bg = colors.bg3 }, -- scrollbar
    PmenuThumb = { bg = colors.grey0 }, -- Thumb of the scrollbar

    Normal = { fg = colors.fg0, bg = colors.bg0 }, -- normal text
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = colors.fg1, bg = colors.bg3 },

    Question = { fg = colors.yellow }, -- hit-enter prompt and yes/no questions

    SpellBad = { undercurl = true, sp = colors.red }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    SpellCap = { undercurl = true, sp = colors.green }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    SpellLocal = { undercurl = true, sp = colors.red }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    SpellRare = { undercurl = true, sp = colors.orange }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.

    StatusLine = { fg = colors.fg1, bg = colors.bg_statusline1 }, -- status line of current window
    StatusLineTerm = { link = "StatusLine" }, -- status line of current :terminal window
    StatusLineNC = { fg = colors.grey1, bg = colors.bg_statusline1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTermNC = { link = "StatusLineNC" }, -- status line of non-current :terminal window
    TabLine = { fg = colors.fg1, bg = colors.bg_statusline3 },
    TabLineFill = { fg = colors.fg1, bg = colors.bg_statusline1 },
    TabLineSel = { fg = colors.bg0, bg = colors.grey2 },

    Visual = { bg = colors.bg3 }, -- Visual mode selection
    VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    WildMenu = { link = "PmenuSel" }, --  current match in 'wildmenu' completion

    -------------------------
    -- Specific for neovim --
    -------------------------

    -- LSP Groups (descriptions and ordering from `:h lsp-highlight`)
    LspDiagnosticsDefaultError = { link = "ErrorText" }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsDefaultHint = { link = "HintText" }, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsDefaultInformation = { link = "InfoText" }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsDefaultWarning = { link = "WarningText" }, -- used for "Warning" diagnostic signs in sign column

    LspDiagnosticsSignError = { link = "RedSign" }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsSignHint = { link = "AquaSign" }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsSignInformation = { link = "BlueSign" }, -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { link = "YellowSign" }, -- used for "Warning" diagnostic signs in sign column

    LspDiagnosticsFloatingError = { link = "ErrorFloat" }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingHint = { link = "HintFloat" }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingInformation = { link = "InfoFloat" }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingWarning = { link = "WarningFloat" }, -- used for "Warning" diagnostic messages in the diagnostics float

    LspDiagnosticsVirtualTextError = { link = "VirtualTextError" }, -- Virtual text "Error"
    LspDiagnosticsVirtualTextHint = { link = "VirtualTextHint" }, -- Virtual text "Hint"
    LspDiagnosticsVirtualTextInformation = { link = "VirtualTextInfo" }, -- Virtual text "Information"
    LspDiagntualTextWarning = { link = "VirtualTextWarning" }, -- Virtual text "Warning"

    LspDiagnosticsUnderlineError = { link = "ErrorText" }, -- used to underline "Error" diagnostics.
    LspDiagnosticsUnderlineHint = { link = "HintText" }, -- used to underline "Hint" diagnostics.
    LspDiagnosticsUnderlineInformation = { link = "InfoText" }, -- used to underline "Information" diagnostics.
    LspDiagnosticsUnderlineWarning = { link = "WarningText" }, -- used to underline "Warning" diagnostics.

    LspReferenceRead = { link = "CurrentWord" }, -- used for highlighting "read" references
    LspReferenceText = { link = "CurrentWord" }, -- used for highlighting "text" references
    LspReferenceWrite = { link = "CurrentWord" }, -- used for highlighting "write" references

    TermCursor = { link = "Cursor" },
    healthError = { link = "Error" },
    healthSuccess = { link = "Success" },
    healthWarning = { link = "Warning" },

    DiagnosticError = { link = "Error" },
    DiagnosticWarn = { link = "Warning" },
    DiagnosticInfo = { link = "Info" },
    DiagnosticHint = { link = "Hint" },
    DiagnosticOk = { link = "Success" },
    DiagnosticVirtualTextError = { link = "VirtualTextError" },
    DiagnosticVirtualTextWarn = { link = "VirtualTextWarning" },
    DiagnosticVirtualTextInfo = { link = "VirtualTextInfo" },
    DiagnosticVirtualTextHint = { link = "VirtualTextHint" },
    DiagnosticVirtualTextOk = { link = "Success" },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.green },
    DiagnosticUnderlineOk = { undercurl = true, sp = colors.green },
    DiagnosticFloatingError = { link = "ErrorFloat" },
    DiagnosticFloatingWarn = { link = "WarningFloat" },
    DiagnosticFloatingInfo = { link = "InfoFloat" },
    DiagnosticFloatingHint = { link = "HintFloat" },
    DiagnosticFloatingOk = { link = "HintFloat" },
    DiagnosticSignError = { link = "RedSign" },
    DiagnosticSignWarn = { link = "YellowSign" },
    DiagnosticSignInfo = { link = "BlueSign" },
    DiagnosticSignHint = { link = "GreenSign" },
    DiagnosticSignOk = { link = "GreenSign" },
    DiagnosticDeprecated = { link = "Grey" },
    DiagnosticUnnecessary = { link = "Grey" },

    -----------------------
    -- Filetype specific --
    -----------------------

    markdownH1 = { fg = colors.red, bold = true },
    markdownH2 = { fg = colors.orange, bold = true },
    markdownH3 = { fg = colors.yellow, bold = true },
    markdownH4 = { fg = colors.green, bold = true },
    markdownH5 = { fg = colors.blue, bold = true },
    markdownH6 = { fg = colors.purple, bold = true },
    markdownUrl = { fg = colors.blue, italic = true },
    markdownItalic = { italic = true },
    markdownBold = { bold = true },
    markdownItalicDelimiter = { fg = colors.grey1, italic = true },

    -- ruby
    rubyKeywordAsMethod = { link = "Green" },
    rubyInterpolation = { link = "Yellow" },
    rubyInterpolationDelimiter = { link = "Yellow" },
    rubyStringDelimiter = { link = "Green" },
    rubyBlockParameterList = { link = "Blue" },
    rubyDefine = { link = "Red" },
    rubyModuleName = { link = "Purple" },
    rubyAccess = { link = "Orange" },
    rubyAttribute = { link = "Yellow" },
    rubyMacro = { link = "Red" },

    -- python
    pythonBuiltin = { link = "Yellow" },
    pythonExceptions = { link = "Purple" },
    pythonDecoratorName = { link = "Blue" },

    -- php
    phpVarSelector = { link = "Blue" },
    phpDefine = { link = "Orange" },
    phpStructure = { link = "Red" },
    phpSpecialFunction = { link = "Green" },
    phpInterpSimpleCurly = { link = "Yellow" },
    phpComparison = { link = "Orange" },
    phpMethodsVar = { link = "Aqua" },
    phpMemberSelector = { link = "Aqua" },

    -- matlab
    matlabSemicolon = { link = "Fg" },
    matlabFunction = { link = "Red" },
    matlabImplicit = { link = "Green" },
    matlabDelimiter = { link = "Fg" },
    matlabOperator = { link = "Green" },
    matlabArithmeticOperator = { link = "Orange" },
    matlabRelationalOperator = { link = "Orange" },
    matlabLogicalOperator = { link = "Orange" },

    -- json
    jsonKeyword = { link = "Orange" },
    jsonQuote = { link = "Grey" },
    jsonBraces = { link = "Fg" },

    -- yaml
    yamlKey = { link = "Orange" },
    yamlConstant = { link = "Purple" },

    -- toml
    tomlTable = { fg = colors.purple, bold = true },
    tomlKey = { link = "Orange" },
    tomlBoolean = { link = "Aqua" },
    tomlTableArray = { link = "tomlTable" },

    -- make
    makeIdent = { link = "Aqua" },
    makeSpecTarget = { link = "Yellow" },
    makeTarget = { link = "Blue" },
    makeCommands = { link = "Orange" },

    -- help
    helpNote = { fg = colors.purple, bold = true },
    helpHeadline = { fg = colors.red, bold = true },
    helpHeader = { fg = colors.orange, bold = true },
    helpURL = { fg = colors.green, underline = true },
    helpHyperTextEntry = { fg = colors.yellow, bold = true },
    helpHyperTextJump = { link = "Yellow" },
    helpCommand = { link = "Aqua" },
    helpExample = { link = "Green" },
    helpSpecial = { link = "Blue" },
    helpSectionDelim = { link = "Grey" },

    -- gitcommit
    gitcommitSummary = { link = "Red" },
    gitcommitUntracked = { link = "Grey" },
    gitcommitDiscarded = { link = "Grey" },
    gitcommitSelected = { link = "Grey" },
    gitcommitUnmerged = { link = "Grey" },
    gitcommitOnBranch = { link = "Grey" },
    gitcommitArrow = { link = "Grey" },
    gitcommitFile = { link = "Green" },

    -- diff
    diffAdded = { link = "Green" },
    diffRemoved = { link = "Red" },
    diffChanged = { link = "Blue" },
    diffOldFile = { link = "Yellow" },
    diffNewFile = { link = "Orange" },
    diffFile = { link = "Aqua" },
    diffLine = { link = "Grey" },
    diffIndexLine = { link = "Purple" },

    -------------------------
    -- Treesitter specific --
    -------------------------

    TSAnnotation = { link = "Purple" }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = { link = "Purple" },
    TSBold = { bold = true },
    TSBoolean = { link = "Purple" }, -- For booleans.
    TSCharacter = { link = "Aqua" }, -- For characters.
    TSComment = { link = "Comment" },
    TSConditional = { link = "Red" },
    TSConstBuiltin = { link = "Blue" }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro = { link = "Blue" }, -- For constants that are defined by macros: `NULL` in C.
    TSConstant = { link = "Fg" }, -- For constants
    TSConstructor = { link = "Green" }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSDanger = { fg = colors.bg0, bg = colors.red, bold = true },
    TSEmphasis = { bold = true },
    TSError = { link = "Error" }, -- For syntax/parser errors.
    TSException = { link = "Red" }, -- For exception related keywords.
    TSField = { link = "Green" }, -- For fields.
    TSFloat = { link = "Purple" }, -- For floats.
    TSFuncBuiltin = { link = "Green" },
    TSFuncMacro = { link = "Green" }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSFunction = { link = "Green" },
    TSInclude = { link = "Red" }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { link = "Red" },
    TSKeywordFunction = { link = "Red" },
    TSKeywordOperator = { link = "Orange" },
    TSLabel = { link = "Orange" }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMath = { fg = "Blue" },
    TSMethod = { link = "Green" },
    TSNamespace = { link = "Yellow" }, -- For identifiers referring to modules and namespaces.
    TSNone = { link = "Fg" },
    TSNumber = { link = "Purple" }, -- For all numbers
    TSOperator = { link = "Orange" }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { link = "Fg" }, -- For parameters of a function.
    TSParameterReference = { link = "Fg" }, -- For references to parameters of a function.
    TSProperty = { link = "Green" }, -- Same as `TSField`,accesing for struct members in C.
    TSPunctBracket = { link = "Fg" }, -- For brackets and parens.
    TSPunctDelimiter = { link = "Grey" }, -- For delimiters ie: `.`
    TSPunctSpecial = { link = "Blue" }, -- For special punctutation that does not fall in the catagories before.
    TSRepeat = { link = "Red" },
    TSStrike = { link = "Grey" }, -- For strikethrough text.
    TSString = { link = "Aqua" },
    TSStringEscape = { link = "Green" }, -- For escape characters within a string.
    TSStringRegex = { link = "Green" }, -- For regexes.
    TSStroung = { bold = true },
    TSStructure = { link = "Blue" },
    TSSymbol = { link = "Fg" }, -- For identifiers referring to symbols or atoms.
    TSTag = { link = "Orange" }, -- Tags like html tag names.
    TSTagDelimiter = { link = "Green" }, -- Tag delimiter like `<` `>` `/`
    TSText = { link = "Green" }, -- For strings considered text in a markup language.
    TSType = { link = "Yellow" }, -- For types.
    TSTypeBuiltin = { link = "Yellow" }, -- For builtin types.
    TSURI = { link = "markdownUrl" }, -- Any URI like a link or email.
    TSUnderline = { underline = true },
    TSVariable = { link = "Fg" },
    TSVariableBuiltin = { link = "Blue" },

    -- NOTE: changes due to new capture names (see:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

    -- identifiers
    ["@variable"] = { link = "Blue" },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter"] = { link = "@variable" },
    ["@variable.parameter.builtin"] = { link = "@variable.builtin" },
    ["@variable.member"] = { link = "@variable" },

    ["@constant"] = { link = "Aqua" },
    ["@constant.builtin"] = { link = "Yellow" },
    ["@constant.macro"] = { link = "Blue" },

    ["@module"] = { link = "Blue" },
    ["@module.builtin"] = { link = "@module" },

    ["@label"] = { link = "Orange" },

    -- literals
    ["@string"] = { link = "Aqua" },
    ["@string.documentation"] = { link = "Comment" },
    ["@string.regexp"] = { link = "Green" },
    ["@string.escape"] = { link = "Yellow" },
    ["@string.special"] = { link = "@string" },
    ["@string.special.symbol"] = { link = "@string" },
    ["@string.special.url"] = { link = "Yellow" },
    ["@string.special.path"] = { link = "@string" },

    ["@character"] = { link = "Aqua" },
    ["@character.special"] = { link = "Aqua" },
    ["@character.printf"] = { link = "Green" },

    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Purple" },
    ["@number.float"] = { link = "@number" },

    -- types
    ["@type"] = { link = "Yellow" },
    ["@type.builtin"] = { link = "@type" },
    ["@type.definition"] = { link = "@type" },

    ["@attribute"] = { link = "Purple" },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@property"] = { link = "Green" },

    -- functions
    ["@function"] = { link = "Green" },
    ["@function.builtin"] = { link = "Yellow" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Aqua" },

    ["@function.method"] = { link = "Green" },
    ["@function.method.call"] = { link = "@method" },

    ["@constructor"] = { link = "Green" },
    ["@operator"] = { link = "Orange" },

    -- keywords
    ["@keyword"] = { link = "Red" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.function"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@keyword" },
    ["@keyword.import"] = { link = "@keyword" },
    ["@keyword.type"] = { link = "@keyword" },
    ["@keyword.modifier"] = { link = "@keyword" },
    ["@keyword.repeat"] = { link = "@keyword" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@keyword.debug"] = { link = "@keyword" },
    ["@keyword.exception"] = { link = "@keyword" },

    ["@keyword.conditional"] = { link = "Red" },
    ["@keyword.conditional.ternary"] = { link = "@keyword.conditional" },

    ["@keyword.directive"] = { link = "Red" },
    ["@keyword.directive.define"] = { link = "@keyword.directive" },

    -- punctuation
    ["@punctuation.delimiter"] = { link = "Fg" },
    ["@punctuation.bracket"] = { link = "Fg" },
    ["@punctuation.special"] = { link = "Fg" },

    -- comments
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },

    ["@comment.error"] = { link = "Error" },
    ["@comment.warning"] = { link = "Warning" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "Info" },

    -- markup
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { link = "Grey" },
    ["@markup.underline"] = { underline = true },

    -- ["@markup.heading"] = {},
    ["@markup.heading.1"] = { fg = colors.red, bold = true },
    ["@markup.heading.2"] = { fg = colors.orange, bold = true },
    ["@markup.heading.3"] = { fg = colors.yellow, bold = true },
    ["@markup.heading.4"] = { fg = colors.green, bold = true },
    ["@markup.heading.5"] = { fg = colors.blue, bold = true },
    ["@markup.heading.6"] = { fg = colors.purple, bold = true },

    ["@markup.quote"] = { link = "Grey" },
    ["@markup.math"] = { link = "Blue" },

    ["@markup.link"] = { fg = colors.blue },
    ["@markup.link.label"] = { fg = colors.blue },
    ["@markup.link.url"] = { fg = colors.blue, italic = true },

    ["@markup.raw"] = { link = "Purple" },
    ["@markup.raw.inline"] = { link = "Purple" },
    ["@markup.raw.block"] = { link = "Purple" },

    ["@markup.list"] = { link = "Orange" },
    ["@markup.list.checked"] = { link = "Green" },
    ["@markup.list.numbered"] = { link = "Aqua" },
    ["@markup.list.unchecked"] = { link = "Red" },
    ["@markup.list.unnumbered"] = { link = "Orange" },

    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    ["@tag"] = { link = "Orange" },
    ["@tag.builtin"] = { link = "@tag" },
    ["@tag.attribute"] = { link = "@tag" },
    ["@tag.delimiter"] = { link = "Green" },

    ["@text.title.1.marker.markdown"] = { link = "@markup.heading.1" },
    ["@text.title.2.marker.markdown"] = { link = "@markup.heading.2" },
    ["@text.title.3.marker.markdown"] = { link = "@markup.heading.3" },
    ["@text.title.4.marker.markdown"] = { link = "@markup.heading.4" },
    ["@text.title.5.marker.markdown"] = { link = "@markup.heading.5" },
    ["@text.title.6.marker.markdown"] = { link = "@markup.heading.6" },

    ---------------------
    -- Plugin specific --
    ---------------------

    -- nvim-telescope/telescope.nvim
    TelescopeBorder = { link = "Grey" },
    TelescopeMatching = { fg = colors.green, bold = true },
    TelescopePromptPrefix = { link = "Orange" },
    TelescopeSelection = { link = "DiffAdd" },

    -- preservim/nerdtree
    NERDTreeCWD = { link = "Aqua" },
    NERDTreeClosable = { link = "Orange" },
    NERDTreeDir = { link = "Green" },
    NERDTreeDirSlash = { link = "Aqua" },
    NERDTreeExecFile = { link = "Yellow" },
    NERDTreeFile = { link = "Fg" },
    NERDTreeFlags = { link = "Orange" },
    NERDTreeHelp = { link = "Grey" },
    NERDTreeLinkFile = { link = "Grey" },
    NERDTreeLinkTarget = { link = "Green" },
    NERDTreeOpenable = { link = "Orange" },
    NERDTreeToggleOff = { link = "Red" },
    NERDTreeToggleOn = { link = "Green" },
    NERDTreeUp = { link = "Grey" },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { link = "Green" },
    NvimTreeExecFile = { link = "Fg" },
    NvimTreeFolderIcon = { link = "Orange" },
    NvimTreeFolderName = { link = "Green" },
    NvimTreeGitDeleted = { link = "Red" },
    NvimTreeGitDirty = { link = "Yellow" },
    NvimTreeGitMerge = { link = "Orange" },
    NvimTreeGitNew = { link = "Aqua" },
    NvimTreeGitRenamed = { link = "Purple" },
    NvimTreeGitStaged = { link = "Blue" },
    NvimTreeImageFile = { link = "Fg" },
    NvimTreeIndentMarker = { link = "Grey" },
    NvimTreeMarkdownFile = { link = "Fg" },
    NvimTreeOpenedFile = { link = "Fg" },
    NvimTreeOpenedFolderName = { link = "Green" },
    NvimTreeRootFolder = { link = "Grey" },
    NvimTreeSpecialFile = { link = "Fg" },
    NvimTreeSymlink = { link = "Fg" },

    -- mhinz/vim-startify
    StartifyBracket = { link = "Grey" },
    StartifyFile = { link = "Fg" },
    StartifyFooter = { link = "Grey" },
    StartifyHeader = { link = "Orange" },
    StartifyNumber = { link = "Red" },
    StartifyPath = { link = "Green" },
    StartifySection = { link = "Blue" },
    StartifySlash = { link = "Green" },
    StartifySpecial = { link = "Grey" },

    -- mbbill/undotree
    UndotreeBranch = { link = "Yellow" },
    UndotreeCurrent = { link = "Aqua" },
    UndotreeHead = { link = "Yellow" },
    UndotreeNext = { link = "Blue" },
    UndotreeNode = { link = "Orange" },
    UndotreeNodeCurrent = { link = "Red" },
    UndotreeSavedBig = { fg = colors.purple, bold = true },
    UndotreeSavedSmall = { link = "Purple" },
    UndotreeSeq = { link = "Green" },
    UndotreeTimeStamp = { link = "Grey" },

    -- liuchengxu/vista.vim
    VistaBracket = { link = "Grey" },
    VistachildrenNr = { link = "Orange" },
    VistaScope = { link = "Red" },
    VistaTag = { link = "Green" },
    VistaPrefix = { link = "Grey" },
    VistaIcon = { link = "Orange" },
    VistaScopeKind = { link = "Yellow" },
    VistaColon = { link = "Grey" },
    VistaLineNr = { link = "Grey" },
    VistaHeadNr = { link = "Fg" },
    VistaPublic = { link = "Green" },
    VistaProtected = { link = "Yellow" },
    VistaPrivate = { link = "Red" },

    -- airblade/vim-gitgutter
    GitGutterAdd = { link = "GreenSign" },
    GitGutterChange = { link = "BlueSign" },
    GitGutterDelete = { link = "RedSign" },
    GitGutterChangeDelete = { link = "PurpleSign" },

    -- mhinz/vim-signify
    SignifySignAdd = { link = "GreenSign" },
    SignifySignChange = { link = "BlueSign" },
    SignifySignDelete = { link = "RedSign" },
    SignifySignChangeDelete = { link = "PurpleSign" },

    -- phaazon/hop.nvim
    HopNextKey = { fg = colors.orange, bold = true },
    HopNextKey1 = { fg = colors.green, bold = true },
    HopNextKey2 = { link = "Green" },
    HopUnmatched = { link = "Grey" },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineContextChar = { link = "CursorLineNr" },
    IndentBlanklineChar = { link = "LineNr" },
    IndentBlanklineSpaceChar = { link = "LineNr" },
    IndentBlanklineSpaceCharBlankline = { link = "LineNr" },

    -- liuchengxu/vim-which-key
    WhichKey = { link = "Red" },
    WhichKeySeperator = { link = "Green" },
    WhichKeyGroup = { link = "Yellow" },
    WhichKeyDesc = { link = "Blue" },

    -- p00f/nvim-ts-rainbow
    rainbowcol1 = { link = "Red" },
    rainbowcol2 = { link = "Orange" },
    rainbowcol3 = { link = "Yellow" },
    rainbowcol4 = { link = "Green" },
    rainbowcol5 = { link = "Aqua" },
    rainbowcol6 = { link = "Blue" },
    rainbowcol7 = { link = "Purple" },

    -- vim-syntastic/syntastic
    SyntasticError = { link = "ErrorText" },
    SyntasticWarning = { link = "WarningText" },
    SyntasticErrorSign = { link = "RedSign" },
    SyntasticWarningSign = { link = "YellowSign" },
    SyntasticErrorLine = { link = "ErrorLine" },
    SyntasticWarningLine = { link = "warningline" },

    -- junegunn/vim-plug
    plug1 = { fg = colors.orange, bold = true },
    plugNumber = { fg = colors.yellow, bold = true },
    plug2 = { link = "Green" },
    plugBracket = { link = "Grey" },
    plugName = { link = "Aqua" },
    plugDash = { link = "Orange" },
    plugError = { link = "Red" },
    plugNotLoaded = { link = "Grey" },
    plugRelDate = { link = "Grey" },
    plugH2 = { link = "Orange" },
    plugMessage = { link = "Orange" },
    plugStar = { link = "Red" },
    plugUpdate = { link = "Blue" },
    plugDeleted = { link = "Grey" },
    plugEdge = { link = "Yellow" },
    plugSha = { link = "Green" },

    -- rcarriga/nvim-notify
    NotifyBackground = { bg = "#000000" },
    NotifyERRORBorder = { link = "Error" },
    NotifyERRORIcon = { link = "Error" },
    NotifyERRORTitle = { link = "Error" },
    NotifyWARNBorder = { link = "Warning" },
    NotifyWARNIcon = { link = "Warning" },
    NotifyWARNTitle = { link = "Warning" },
    NotifyINFOBorder = { link = "Info" },
    NotifyINFOIcon = { link = "Info" },
    NotifyINFOTitle = { link = "Info" },
    NotifyDEBUGBorder = { link = "Hint" },
    NotifyDEBUGIcon = { link = "Hint" },
    NotifyDEBUGTitle = { link = "Hint" },
    NotifyTRACEBorder = { link = "Success" },
    NotifyTRACEIcon = { link = "Success" },
    NotifyTRACETitle = { link = "Success" },

    -- RRethy/vim-illuminate
    IlluminatedWordText = { link = "DiffChange" },
    IlluminatedWordRead = { link = "DiffAdd" },
    IlluminatedWordWrite = { link = "DiffDelete" },

    -- hrsh7th/nvim-cmp
    CmpItemAbbrDeprecated = { fg = colors.grey1, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.purple, bold = true },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemMenu = { fg = colors.grey2 },
    CmpItemKindField = { fg = colors.blue },
    CmpItemKindProperty = { link = "CmpItemKindField" },
    CmpItemKindEvent = { link = "CmpItemKindField" },
    CmpItemKindText = { fg = colors.grey1 },
    CmpItemKindEnum = { fg = colors.red },
    CmpItemKindKeyword = { link = "CmpItemKindEnum" },
    CmpItemKindConstant = { fg = colors.purple },
    CmpItemKindConstructor = { link = "CmpItemKindConstant" },
    CmpItemKindReference = { link = "CmpItemKindConstant" },
    CmpItemKindFunction = { fg = colors.yellow },
    CmpItemKindStruct = { link = "CmpItemKindFunction" },
    CmpItemKindClass = { link = "CmpItemKindFunction" },
    CmpItemKindModule = { link = "CmpItemKindFunction" },
    CmpItemKindOperator = { link = "CmpItemKindFunction" },
    CmpItemKindVariable = { fg = colors.aqua },
    CmpItemKindFile = { link = "CmpItemKindVariable" },
    CmpItemKindUnit = { fg = colors.green },
    CmpItemKindSnippet = { link = "CmpItemKindUnit" },
    CmpItemKindFolder = { link = "CmpItemKindUnit" },
    CmpItemKindMethod = { fg = colors.blue },
    CmpItemKindValue = { link = "CmpItemKindMethod" },
    CmpItemKindEnumMember = { link = "CmpItemKindMethod" },
    CmpItemKindInterface = { fg = colors.orange },
    CmpItemKindColor = { link = "CmpItemKindInterface" },
    CmpItemKindTypeParameter = { link = "CmpItemKindInterface" },

    -- neorg
    NeorgHeading1Title = { link = "Red" },
    NeorgHeading2Title = { link = "Orange" },
    NeorgHeading3Title = { link = "Yellow" },
    NeorgHeading4Title = { link = "Green" },
    NeorgHeading5Title = { link = "Blue" },
    NeorgHeading6Title = { link = "Purple" },
    NeorgHeading1Prefix = { link = "Red" },
    NeorgHeading2Prefix = { link = "Orange" },
    NeorgHeading3Prefix = { link = "Yellow" },
    NeorgHeading4Prefix = { link = "Green" },
    NeorgHeading5Prefix = { link = "Blue" },
    NeorgHeading6Prefix = { link = "Purple" },

    -- Headlines
    Headline1 = { bg = utils.blend(colors.red, colors.bg0, 0.18) },
    Headline2 = { bg = utils.blend(colors.orange, colors.bg0, 0.18) },
    Headline3 = { bg = utils.blend(colors.yellow, colors.bg0, 0.18) },
    Headline4 = { bg = utils.blend(colors.green, colors.bg0, 0.18) },
    Headline5 = { bg = utils.blend(colors.blue, colors.bg0, 0.18) },
    Headline6 = { bg = utils.blend(colors.purple, colors.bg0, 0.18) },
  }
end

return groups
