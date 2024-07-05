-- Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
-- Copyright (c) 2016-present Sven Greb <code@svengreb.de>
-- Copyright (c) 2022-present Mac Lee <macthecadillac@gmail.com>

-- Project: Nord Vim
-- Repository: https://github.com/arcticicestudio/nord-vim
-- License: MIT

vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") then
  vim.cmd.syntax("reset")
end

vim.opt.background = "dark"

-- Color Definition
local polar_night_0 = "#2E3440"
local polar_night_1 = "#3B4252"
local polar_night_2 = "#434C5E"
local polar_night_3 = "#4C566A"
local polar_night_4 = "#616E88"
local snow_storm_0 = "#D8DEE9"
local snow_storm_1 = "#E5E9F0"
local snow_storm_2 = "#ECEFF4"
local frost_0 = "#8FBCBB"
local frost_1 = "#88C0D0"
local frost_2 = "#81A1C1"
local frost_3 = "#5E81AC"
local aurora_0 = "#BF616A"
local aurora_1 = "#D08770"
local aurora_2 = "#EBCB8B"
local aurora_3 = "#A3BE8C"
local aurora_4 = "#B48EAD"

-- +---------------+
-- + UI Components +
-- +---------------+
-- +--- Attributes ---+
vim.api.nvim_set_hl(0, "Bold", { bold = true })
vim.api.nvim_set_hl(0, "Italic", { italic = true })
vim.api.nvim_set_hl(0, "Underline", { underline = true })

-- +--- Editor ---+
vim.api.nvim_set_hl(0, "ColorColumn", { bg = polar_night_1, ctermfg = "NONE", ctermbg = 0 })
vim.api.nvim_set_hl(0, "Cursor", { fg = polar_night_0, bg = snow_storm_0, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = polar_night_1, ctermfg = "NONE", ctermbg = 0, cterm = {} })
vim.api.nvim_set_hl(0, "Error", { fg = polar_night_0, bg = aurora_0, ctermbg = 1 })
vim.api.nvim_set_hl(0, "iCursor", { fg = polar_night_0, bg = snow_storm_0, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = polar_night_3, bg = polar_night_0, ctermfg = 8, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = frost_1, bg = polar_night_3, ctermfg = 6, ctermbg = 8 })
vim.api.nvim_set_hl(0, "NonText", { fg = polar_night_2, ctermfg = 8 })
vim.api.nvim_set_hl(0, "Normal", { fg = snow_storm_0, bg = polar_night_0, ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = snow_storm_0, bg = polar_night_1, ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "PMenu", { fg = snow_storm_0, bg = polar_night_1, ctermfg = "NONE", ctermbg = 0, cterm = {}
})
vim.api.nvim_set_hl(0, "PmenuSbar", { fg = snow_storm_0, bg = polar_night_2, ctermfg = "NONE", ctermbg = 0 })
vim.api.nvim_set_hl(0, "PMenuSel", { fg = snow_storm_1, bg = polar_night_3, ctermfg = 6, ctermbg = 8 })
vim.api.nvim_set_hl(0, "PmenuThumb", { fg = frost_1, bg = polar_night_3, ctermfg = "NONE", ctermbg = 8 })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = polar_night_3, ctermfg = 8 })
vim.api.nvim_set_hl(0, "SpellBad", {
  fg = aurora_0,
  bg = polar_night_0,
  ctermfg = 1,
  ctermbg = "NONE",
  undercurl = true,
  cterm = { underline = true },
  sp = aurora_0
})
vim.api.nvim_set_hl(0, "SpellCap", {
  fg = aurora_2,
  bg = polar_night_0,
  ctermfg = 3,
  ctermbg = "NONE",
  undercurl = true,
  cterm = { underline = true },
  sp = aurora_2
})
vim.api.nvim_set_hl(0, "SpellLocal", {
  fg = snow_storm_1,
  bg = polar_night_0,
  ctermfg = 7,
  ctermbg = "NONE",
  undercurl = true,
  cterm = { underline = true },
  sp = snow_storm_1
})
vim.api.nvim_set_hl(0, "SpellRare", {
  fg = snow_storm_2,
  bg = polar_night_0,
  ctermfg = 15,
  ctermbg = "NONE",
  undercurl = true,
  cterm = { underline = true },
  sp = snow_storm_2
})
vim.api.nvim_set_hl(0, "Visual", { bg = polar_night_2, ctermbg = 0 })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = polar_night_2, ctermbg = 0 })

-- +- Neovim Support -+
vim.api.nvim_set_hl(0, "healthError", { fg = aurora_0, bg = polar_night_1, ctermfg = 1, ctermbg = 0 })
vim.api.nvim_set_hl(0, "healthSuccess", { fg = aurora_3, bg = polar_night_1, ctermfg = 2, ctermbg = 0 })
vim.api.nvim_set_hl(0, "healthWarning", { fg = aurora_2, bg = polar_night_1, ctermfg = 3, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TermCursorNC", { bg = polar_night_1, ctermbg = 0 })

-- +--- Gutter ---+
vim.api.nvim_set_hl(0, "CursorColumn", { bg = polar_night_1, ctermfg = "NONE", ctermbg = 0 })
vim.api.nvim_set_hl(0, "CursorLineNr", {fg = snow_storm_0, bg = polar_night_0, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "Folded", {
  fg = polar_night_3,
  bg = polar_night_1,
  ctermfg = 8,
  ctermbg = 0,
  bold = true,
  cterm = { bold = true }
})
vim.api.nvim_set_hl(0, "FoldColumn", { fg = polar_night_3, bg = polar_night_0, ctermfg = 8, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { fg = polar_night_1, bg = polar_night_0, ctermfg = 0, ctermbg = "NONE" })

-- +--- Navigation ---+
vim.api.nvim_set_hl(0, "Directory", { fg = frost_1, ctermfg = 6, ctermbg = "NONE" })

-- +--- Prompt/Status ---+
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = polar_night_1, ctermfg = 0, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = snow_storm_0, bg = aurora_0, ctermfg = "NONE", ctermbg = 1 })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = snow_storm_0, fg = snow_storm_0 })
vim.api.nvim_set_hl(0, "Question", { fg = snow_storm_0, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", {
  fg = snow_storm_0,
  bg = polar_night_3,
  ctermfg = 7,
  ctermbg = 8,
  cterm = {}
})
vim.api.nvim_set_hl(0, "StatusLineNC", {
  fg = snow_storm_0,
  bg = polar_night_1,
  ctermfg = "NONE",
  ctermbg = 0,
  cterm = {}
})
vim.api.nvim_set_hl(0, "StatusLineTerm", {
  fg = snow_storm_0,
  bg = polar_night_3,
  ctermfg = 7,
  ctermbg = 8,
  cterm = {}
})
vim.api.nvim_set_hl(0, "StatusLineTermNC", {
  fg = snow_storm_0,
  bg = polar_night_1,
  ctermfg = "NONE",
  ctermbg = 0,
  cterm = {}
})
vim.api.nvim_set_hl(0, "WarningMsg", { fg = polar_night_0, bg = aurora_2, ctermfg = 0, ctermbg = 3 })
vim.api.nvim_set_hl(0, "WildMenu", { fg = polar_night_1, bg = frost_1, ctermfg = 6, ctermbg = 0 })

-- +--- Search ---+
vim.api.nvim_set_hl(0, "IncSearch", { fg = polar_night_1, bg = frost_1, ctermfg = 0, ctermbg = 6, cterm = {} })
vim.api.nvim_set_hl(0, "Search", { fg = polar_night_1, bg = frost_1, ctermfg = 0, ctermbg = 6, cterm = {} })

-- +--- Tabs ---+
vim.api.nvim_set_hl(0, "TabLine", {
  fg = snow_storm_0,
  bg = polar_night_1,
  ctermfg = "NONE",
  ctermbg = 0,
  cterm = {}
})
vim.api.nvim_set_hl(0, "TabLineFill", {
  fg = snow_storm_0,
  bg = polar_night_1,
  ctermfg = "NONE",
  ctermbg = 0,
  cterm = {}
})
vim.api.nvim_set_hl(0, "TabLineSel", {
  fg = frost_1,
  bg = polar_night_3,
  ctermfg = 6,
  ctermbg = 8,
  cterm = {}
})

-- +--- Window ---+
vim.api.nvim_set_hl(0, "Title", { fg = snow_storm_0, ctermfg = "NONE", cterm = {} })
vim.api.nvim_set_hl(0, "VertSplit", { fg = polar_night_0, bg = polar_night_0, ctermfg = 0, ctermbg = 0, cterm = {} })

-- +----------------------+
-- + Language Base Groups +
-- +----------------------+
vim.api.nvim_set_hl(0, "Boolean", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Character", { fg = aurora_3, ctermfg = 2 })
vim.api.nvim_set_hl(0, "Comment", { fg = polar_night_4, ctermfg = 8, italic = true, cterm = { italic = true }, })
vim.api.nvim_set_hl(0, "Conditional", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Constant", { fg = snow_storm_0, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "Define", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Delimiter", { fg = snow_storm_2, ctermfg = 15 })
vim.api.nvim_set_hl(0, "Exception", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Float", { fg = aurora_4, ctermfg = 5 })
vim.api.nvim_set_hl(0, "Function", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "Identifier", { fg = snow_storm_0, ctermfg = "NONE", cterm = {} })
vim.api.nvim_set_hl(0, "Include", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Keyword", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Label", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Number", { fg = aurora_4, ctermfg = 5 })
vim.api.nvim_set_hl(0, "Operator", { fg = frost_2, ctermfg = 4, cterm = {} })
vim.api.nvim_set_hl(0, "PreProc", { fg = frost_2, ctermfg = 4, cterm = {} })
vim.api.nvim_set_hl(0, "Repeat", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Special", { fg = snow_storm_0, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = aurora_2, ctermfg = 3 })
vim.api.nvim_set_hl(0, "SpecialComment", { fg = frost_1, ctermfg = 6, italic = true, cterm = { italic = true} })
vim.api.nvim_set_hl(0, "Statement", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "StorageClass", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "String", { fg = aurora_3, ctermfg = 2 })
vim.api.nvim_set_hl(0, "Structure", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Tag", { fg = snow_storm_0 })
vim.api.nvim_set_hl(0, "Todo", { fg = aurora_2, bg = "NONE", ctermfg = 3, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Type", { fg = frost_2, ctermfg = 4, cterm = {} })
vim.api.nvim_set_hl(0, "Typedef", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "Macro", { fg = frost_0, ctermfg = 14 })

-- +-----------+
-- + Languages +
-- +-----------+
vim.api.nvim_set_hl(0, "awkCharClass", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "awkPatterns", { fg = frost_2, ctermfg = 4, bold = true, cterm = { bold = true } })
vim.api.nvim_set_hl(0, "awkArrayElement", { link = "Identifier" })
vim.api.nvim_set_hl(0, "awkBoolLogic", { link = "Keyword" })
vim.api.nvim_set_hl(0, "awkBrktRegExp", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "awkComma", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "awkExpression", { link = "Keyword" })
vim.api.nvim_set_hl(0, "awkFieldVars", { link = "Identifier" })
vim.api.nvim_set_hl(0, "awkLineSkip", { link = "Keyword" })
vim.api.nvim_set_hl(0, "awkOperator", { link = "Operator" })
vim.api.nvim_set_hl(0, "awkRegExp", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "awkSearch", { link = "Keyword" })
vim.api.nvim_set_hl(0, "awkSemicolon", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "awkSpecialCharacter", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "awkSpecialPrintf", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "awkVariables", { link = "Identifier" })

vim.api.nvim_set_hl(0, "cIncluded", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "cOperator", { link = "Operator" })
vim.api.nvim_set_hl(0, "cPreCondit", { link = "PreCondit" })

vim.api.nvim_set_hl(0, "csPreCondit", { link = "PreCondit" })
vim.api.nvim_set_hl(0, "csType", { link = "Type" })
vim.api.nvim_set_hl(0, "csXmlTag", { link = "SpecialComment" })

vim.api.nvim_set_hl(0, "cssAttributeSelector", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "cssDefinition", { fg = frost_0, ctermfg = 14, cterm = {} })
vim.api.nvim_set_hl(0, "cssIdentifier", { fg = frost_0,
  ctermfg = 14,
  underline = true,
  cterm = { underline = true}
})
vim.api.nvim_set_hl(0, "cssStringQ", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "cssAttr", { link = "Keyword" })
vim.api.nvim_set_hl(0, "cssBraces", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "cssClassName", { link = "cssDefinition" })
vim.api.nvim_set_hl(0, "cssColor", { link = "Number" })
vim.api.nvim_set_hl(0, "cssProp", { link = "cssDefinition" })
vim.api.nvim_set_hl(0, "cssPseudoClass", { link = "cssDefinition" })
vim.api.nvim_set_hl(0, "cssPseudoClassId", { link = "cssPseudoClass" })
vim.api.nvim_set_hl(0, "cssVendor", { link = "Keyword" })

vim.api.nvim_set_hl(0, "dosiniHeader", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "dosiniLabel", { link = "Type" })

vim.api.nvim_set_hl(0, "dtBooleanKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "dtExecKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "dtLocaleKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "dtNumericKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "dtTypeKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "dtDelim", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "dtLocaleValue", { link = "Keyword" })
vim.api.nvim_set_hl(0, "dtTypeValue", { link = "Keyword" })

vim.api.nvim_set_hl(0, "DiffAdd", {
  fg = aurora_3,
  bg = polar_night_0,
  ctermfg = 2,
  ctermbg = "NONE",
  reverse = true,
  cterm = { reverse = true }
})
vim.api.nvim_set_hl(0, "DiffChange", {
  fg = aurora_2,
  bg = polar_night_0,
  ctermfg = 3,
  ctermbg = "NONE",
  reverse = true,
  cterm = { reverse = true }
})
vim.api.nvim_set_hl(0, "DiffDelete", {
  fg = aurora_0,
  bg = polar_night_0,
  ctermfg = 1,
  ctermbg = "NONE",
  reverse = true,
  cterm = { reverse = true }
})
vim.api.nvim_set_hl(0, "DiffText", {
  fg = frost_2,
  bg = polar_night_0,
  ctermfg = 4,
  ctermbg = "NONE",
  reverse = true,
  cterm = { reverse = true }
})

-- Legacy groups for official git.vim and diff.vim syntax
vim.api.nvim_set_hl(0, "diffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "diffChanged", { link = "DiffChange" })
vim.api.nvim_set_hl(0, "diffRemoved", { link = "DiffDelete" })

vim.api.nvim_set_hl(0, "gitconfigVariable", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "goBuiltins", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "goConstants", { link = "Keyword" })

vim.api.nvim_set_hl(0, "helpBar", { fg = polar_night_3, ctermfg = 8 })
vim.api.nvim_set_hl(0, "helpHyperTextJump", {
  fg = frost_1,
  ctermfg = 6,
  underline = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "htmlArg", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "htmlLink", { fg = snow_storm_0, cterm = {}, sp = "NONE" })
vim.api.nvim_set_hl(0, "htmlBold", { link = "Bold" })
vim.api.nvim_set_hl(0, "htmlEndTag", { link = "htmlTag" })
vim.api.nvim_set_hl(0, "htmlItalic", { link = "Italic" })
vim.api.nvim_set_hl(0, "htmlH1", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlH2", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlH3", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlH4", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlH5", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlH6", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "htmlSpecialChar", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "htmlTag", { link = "Keyword" })
vim.api.nvim_set_hl(0, "htmlTagN", { link = "htmlTag" })

vim.api.nvim_set_hl(0, "javaDocTags", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "javaCommentTitle", { link = "Comment" })
vim.api.nvim_set_hl(0, "javaScriptBraces", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "javaScriptIdentifier", { link = "Keyword" })
vim.api.nvim_set_hl(0, "javaScriptNumber", { link = "Number" })

vim.api.nvim_set_hl(0, "jsonKeyword", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "lessClass", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "lessAmpersand", { link = "Keyword" })
vim.api.nvim_set_hl(0, "lessCssAttribute", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "lessFunction", { link = "Function" })
vim.api.nvim_set_hl(0, "cssSelectorOp", { link = "Keyword" })

vim.api.nvim_set_hl(0, "lispAtomBarSymbol", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "lispAtomList", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "lispAtomMark", { link = "Keyword" })
vim.api.nvim_set_hl(0, "lispBarSymbol", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "lispFunc", { link = "Function" })

vim.api.nvim_set_hl(0, "luaFunc", { link = "Function" })

vim.api.nvim_set_hl(0, "markdownBlockquote", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownCode", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownCodeDelimiter", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownFootnote", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownId", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownIdDeclaration", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "markdownH1", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "markdownLinkText", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "markdownUrl", { fg = snow_storm_0, ctermfg = NONE, cterm = {} })
vim.api.nvim_set_hl(0, "markdownBold", { link = "Bold" })
vim.api.nvim_set_hl(0, "markdownBoldDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownFootnoteDefinition", { link = "markdownFootnote" })
vim.api.nvim_set_hl(0, "markdownH2", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "markdownH3", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "markdownH4", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "markdownH5", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "markdownH6", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "markdownIdDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownItalic", { link = "Italic" })
vim.api.nvim_set_hl(0, "markdownItalicDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownLinkDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownLinkTextDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownListMarker", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownRule", { link = "Keyword" })
vim.api.nvim_set_hl(0, "markdownHeadingDelimiter", { link = "Keyword" })

vim.api.nvim_set_hl(0, "perlPackageDecl", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "phpClasses", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "phpDocTags", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "phpDocCustomTags", { link = "phpDocTags" })
vim.api.nvim_set_hl(0, "phpMemberSelector", { link = "Keyword" })

vim.api.nvim_set_hl(0, "podCmdText", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "podVerbatimLine", { fg = snow_storm_0, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "podFormat", { link = "Keyword" })

vim.api.nvim_set_hl(0, "pythonBuiltin", { link = "Type" })
vim.api.nvim_set_hl(0, "pythonEscape", { link = "SpecialChar" })

vim.api.nvim_set_hl(0, "rubyConstant", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "rubySymbol", { fg = snow_storm_2, ctermfg = 15, bold = true, cterm = { bold = true } })
vim.api.nvim_set_hl(0, "rubyAttribute", { link = "Identifier" })
vim.api.nvim_set_hl(0, "rubyBlockParameterList", { link = "Operator" })
vim.api.nvim_set_hl(0, "rubyInterpolationDelimiter", { link = "Keyword" })
vim.api.nvim_set_hl(0, "rubyKeywordAsMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "rubyLocalVariableOrMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "rubyPseudoVariable", { link = "Keyword" })
vim.api.nvim_set_hl(0, "rubyRegexp", { link = "SpecialChar" })

vim.api.nvim_set_hl(0, "sassClass", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "sassId", {
  fg = frost_0,
  ctermfg = 14,
  underline = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "sassAmpersand", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassClassChar", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "sassControl", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassControlLine", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassExtend", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassFor", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassFunctionDecl", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sassFunctionName", { link = "Function" })
vim.api.nvim_set_hl(0, "sassidChar", { link = "sassId" })
vim.api.nvim_set_hl(0, "sassInclude", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "sassMixinName", { link = "Function" })
vim.api.nvim_set_hl(0, "sassMixing", { link = "SpecialChar" })
vim.api.nvim_set_hl(0, "sassReturn", { link = "Keyword" })

vim.api.nvim_set_hl(0, "shCmdParenRegion", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "shCmdSubRegion", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "shDerefSimple", { link = "Identifier" })
vim.api.nvim_set_hl(0, "shDerefVar", { link = "Identifier" })

vim.api.nvim_set_hl(0, "sqlKeyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "sqlSpecial", { link = "Keyword" })

vim.api.nvim_set_hl(0, "vimAugroup", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "vimMapRhs", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "vimNotation", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "vimFunc", { link = "Function" })
vim.api.nvim_set_hl(0, "vimFunction", { link = "Function" })
vim.api.nvim_set_hl(0, "vimUserFunc", { link = "Function" })

vim.api.nvim_set_hl(0, "xmlAttrib", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "xmlCdataStart", { fg = polar_night_3, ctermfg = 8, bold = true, cterm = { bold = true } })
vim.api.nvim_set_hl(0, "xmlNamespace", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "xmlAttribPunct", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "xmlCdata", { link = "Comment" })
vim.api.nvim_set_hl(0, "xmlCdataCdata", { link = "xmlCdataStart" })
vim.api.nvim_set_hl(0, "xmlCdataEnd", { link = "xmlCdataStart" })
vim.api.nvim_set_hl(0, "xmlEndTag", { link = "xmlTagName" })
vim.api.nvim_set_hl(0, "xmlProcessingDelim", { link = "Keyword" })
vim.api.nvim_set_hl(0, "xmlTagName", { link = "Keyword" })

vim.api.nvim_set_hl(0, "yamlBlockMappingKey", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "yamlBool", { link = "Keyword" })
vim.api.nvim_set_hl(0, "yamlDocumentStart", { link = "Keyword" })

-- +----------------+
-- + Plugin Support +
-- +----------------+
-- +--- UI ---+

-- Completion menu color scheme
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = polar_night_4 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = frost_1 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = aurora_4, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg = 'NONE', fg = frost_2 })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { link = 'CmpItemKindText' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'CmpItemKindText' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { bg = 'NONE', fg = aurora_4 })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'CmpItemKindInterface' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'CmpItemKindInterface' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { bg = 'NONE', fg = aurora_3 })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'CmpItemKindStruct' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'CmpItemKindStruct' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'CmpItemKindEnum' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'CmpItemKindStruct' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'CmpItemKindStruct' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = aurora_2 })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = aurora_1 })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { link = 'CmpItemKindConstant' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { bg = 'NONE', fg = aurora_0 })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { link = 'CmpItemKindColor' })

-- Neovim LSP
-- > neovim/nvim-lspconfig
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = aurora_2, ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = aurora_0, ctermfg = 1 })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = frost_3, ctermfg = 12 })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = aurora_2, ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = aurora_0, ctermfg = 1 })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = frost_1, bg = polar_night_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = frost_3, bg = polar_night_1, ctermfg = 12 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = aurora_2, ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = aurora_0, ctermfg = 1 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = frost_3, ctermfg = 12 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = aurora_2, ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = aurora_0, ctermfg = 1 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = frost_3, ctermfg = 12 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarning", {
  fg = aurora_2,
  ctermfg = 3,
  undercurl = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  fg = aurora_0,
  ctermfg = 1,
  undercurl = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInformation", {
  fg = frost_1,
  ctermfg = 6,
  undercurl = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  fg = frost_3,
  ctermfg = 12,
  undercurl = true,
  cterm = { underline = true }
})
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = aurora_2, fg = polar_night_0 })

-- telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = polar_night_1, bg = polar_night_1, ctermfg = 0 })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = frost_1, ctermfg = 0 })
vim.api.nvim_set_hl(0, "TelescopePathSeparator", { fg = snow_storm_2, ctermfg = 0 })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = snow_storm_0, bg = polar_night_1, ctermfg = 0 })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = snow_storm_3, bg = polar_night_1, ctermfg = 0 })
vim.api.nvim_set_hl(0, "TelescopeBufferLoaded", { fg = aurora_2, ctermfg = 0 })

-- floaterm
vim.api.nvim_set_hl(0, "Floatermborder", { fg = polar_night_3, ctermfg = 0 })

-- +--- Languages ---+
-- JavaScript
-- > pangloss/vim-javascript
vim.api.nvim_set_hl(0, "jsGlobalNodeObjects", {
  fg = frost_1,
  ctermfg = 6,
  italic = true,
  cterm = { italic = true }
})
vim.api.nvim_set_hl(0, "jsBrackets", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "jsFuncCall", { link = "Function" })
vim.api.nvim_set_hl(0, "jsFuncParens", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "jsThis", { link = "Keyword" })
vim.api.nvim_set_hl(0, "jsNoise", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "jsPrototype", { link = "Keyword" })
vim.api.nvim_set_hl(0, "jsRegexpString", { link = "SpecialChar" })

-- Markdown
-- > plasticboy/vim-markdown
vim.api.nvim_set_hl(0, "mkdCode", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "mkdFootnote", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "mkdRule", { fg = frost_3, ctermfg = 12 })
vim.api.nvim_set_hl(0, "mkdLineBreak", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "mkdBold", { link = "Bold" })
vim.api.nvim_set_hl(0, "mkdItalic", { link = "Italic" })
vim.api.nvim_set_hl(0, "mkdString", { link = "Keyword" })
vim.api.nvim_set_hl(0, "mkdCodeStart", { link = "mkdCode" })
vim.api.nvim_set_hl(0, "mkdCodeEnd", { link = "mkdCode" })
vim.api.nvim_set_hl(0, "mkdBlockquote", { link = "Comment" })
vim.api.nvim_set_hl(0, "mkdListItem", { link = "Keyword" })
vim.api.nvim_set_hl(0, "mkdListItemLine", { link = "Normal" })
vim.api.nvim_set_hl(0, "mkdFootnotes", { link = "mkdFootnote" })
vim.api.nvim_set_hl(0, "mkdLink", { link = "markdownLinkText" })
vim.api.nvim_set_hl(0, "mkdURL", { link = "markdownUrl" })
vim.api.nvim_set_hl(0, "mkdInlineURL", { link = "mkdURL" })
vim.api.nvim_set_hl(0, "mkdID", { link = "Identifier" })
vim.api.nvim_set_hl(0, "mkdLinkDef", { link = "mkdLink" })
vim.api.nvim_set_hl(0, "mkdLinkDefTarget", { link = "mkdURL" })
vim.api.nvim_set_hl(0, "mkdLinkTitle", { link = "mkdInlineURL" })
vim.api.nvim_set_hl(0, "mkdDelimiter", { link = "Keyword" })

-- YAML
-- > stephpy/vim-yaml
vim.api.nvim_set_hl(0, "yamlKey", { fg = frost_0, ctermfg = 14 })

-- Python
-- vim-python/python-syntax
vim.api.nvim_set_hl(0, "pythonClassVar", { fg = frost_1, ctermfg = 6 })

-- Rust
-- rust-lang/rust.vim
vim.api.nvim_set_hl(0, "rustEnumVariant", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "rustSelf", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "rustAttribute", { fg = aurora_4, ctermfg = 5 })
vim.api.nvim_set_hl(0, "rustDerive", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "rustDeriveTrait", { link = "rustDerive" })

-- OCaml
vim.api.nvim_set_hl(0, "ocamlConstructor", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "ocamlModule", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "ocamlInfixOp", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "ocamlBoolean", { link = "ocamlConstructor" })
vim.api.nvim_set_hl(0, "ocamlModPath", { link = "ocamlModule" })

-- Haskell (better-haskell support)
vim.api.nvim_set_hl(0, "haskellAssocType", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "haskellQuotedType", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "haskellType", { fg = frost_1, ctermfg = 6 })
vim.api.nvim_set_hl(0, "haskellDelimiter", { fg = frost_2, ctermfg = 4 })
vim.api.nvim_set_hl(0, "haskellIdentifier", { fg = frost_0, ctermfg = 14 })
vim.api.nvim_set_hl(0, "haskellPragma", {
  fg = aurora_4,
  ctermfg = 5,
  italic = true,
  cterm = { italic = true }
})
vim.api.nvim_set_hl(0, "haskellLiquid", {
  fg = aurora_4,
  ctermfg = 5,
  italic = true,
  cterm = { italic = true }
})
vim.api.nvim_set_hl(0, "haskellPreProc", {
  fg = aurora_4,
  ctermfg = 5,
  italic = true,
  cterm = { italic = true }
})

-- Haskell (vanilla)
vim.api.nvim_set_hl(0, "hsOperator", { fg = frost_1, ctermfg = 6 })
