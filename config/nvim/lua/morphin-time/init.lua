local M = {}

---@param group string
---@param opts vim.api.keyset.highlight
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup(user_opts)
  user_opts = user_opts or {}
  local c = require("morphin-time.palette").colors

  local transparent = user_opts.transparent or false
  local bg = transparent and c.none or c.bg
  local bg_alt = transparent and c.none or c.bg_alt

  vim.g.colors_name = "morphin-time"
  vim.o.termguicolors = true


  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  --------------------------------------------------------------------------
  -- Editor UI
  --------------------------------------------------------------------------
  hl("Normal",        { fg = c.fg, bg = bg })
  hl("NormalFloat",    { fg = c.fg, bg = bg_alt })
  hl("NormalNC",       { fg = c.fg, bg = bg })
  hl("FloatBorder",    { fg = c.bright_black, bg = bg_alt })
  hl("FloatTitle",     { fg = c.blue, bg = bg_alt, bold = true })

  hl("Cursor",         { fg = bg, bg = c.fg_dark })
  hl("CursorLine",     { bg = "#1f1f21" })
  hl("CursorLineNr",   { fg = c.fg_dark, bold = true })
  hl("CursorColumn",   { bg = "#1f1f21" })
  hl("ColorColumn",    { bg = bg_alt })
  hl("LineNr",         { fg = c.fg_gutter })
  hl("SignColumn",     { fg = c.fg_gutter, bg = bg })

  hl("Visual",         { bg = c.bg_highlight })
  hl("VisualNOS",      { bg = c.bg_highlight })
  hl("Search",         { fg = c.bg, bg = c.yellow })
  hl("IncSearch",      { fg = c.bg, bg = c.orange })
  hl("CurSearch",      { fg = c.bg, bg = c.orange })

  hl("Pmenu",          { fg = c.fg_dark, bg = bg_alt })
  hl("PmenuSel",       { fg = "#ffffff", bg = c.blue_ansi })
  hl("PmenuSbar",      { bg = bg_alt })
  hl("PmenuThumb",     { bg = c.bright_black })

  hl("StatusLine",     { fg = c.fg_dark, bg = bg_alt })
  hl("StatusLineNC",   { fg = c.comment, bg = bg_alt })
  hl("WinSeparator",   { fg = "#454545", bg = bg })
  hl("VertSplit",      { fg = "#454545", bg = bg })


  hl("TabLine",        { fg = "#969696", bg = "#2d2d2d" })
  hl("TabLineSel",     { fg = "#ffffff", bg = bg_alt, bold = true })
  hl("TabLineFill",    { bg = bg_alt })

  hl("Folded",         { fg = c.fg_dark, bg = c.bg_visual })
  hl("FoldColumn",     { fg = c.fg_gutter, bg = bg })


  hl("MatchParen",     { fg = c.bright_black, bg = "#152722", bold = true })
  hl("Whitespace",     { fg = "#373738" })
  hl("NonText",        { fg = "#404040" })
  hl("EndOfBuffer",    { fg = bg })

  hl("Directory",      { fg = c.blue })
  hl("Title",          { fg = c.blue, bold = true })
  hl("ModeMsg",        { fg = c.fg_dark })
  hl("MoreMsg",        { fg = c.green })
  hl("Question",       { fg = c.green })
  hl("WarningMsg",     { fg = c.warning })
  hl("ErrorMsg",       { fg = c.error })

  --------------------------------------------------------------------------
  -- Syntax (classic highlight groups)
  --------------------------------------------------------------------------
  hl("Comment",        { fg = c.comment, italic = true })

  hl("Constant",       { fg = c.orange })
  hl("String",         { fg = c.green })
  hl("Character",      { fg = c.green })
  hl("Number",         { fg = c.orange })
  hl("Boolean",        { fg = c.orange })
  hl("Float",          { fg = c.orange })

  hl("Identifier",     { fg = c.red })
  hl("Function",       { fg = c.blue })

  hl("Statement",      { fg = c.magenta })
  hl("Conditional",    { fg = c.magenta })
  hl("Repeat",         { fg = c.magenta })
  hl("Label",          { fg = c.magenta })
  hl("Operator",       { fg = c.fg_dark })
  hl("Keyword",        { fg = c.magenta })
  hl("Exception",      { fg = c.magenta })

  hl("PreProc",        { fg = c.cyan })
  hl("Include",        { fg = c.blue })
  hl("Define",         { fg = c.magenta })
  hl("Macro",          { fg = c.cyan })
  hl("PreCondit",      { fg = c.cyan })

  hl("Type",           { fg = c.yellow })
  hl("StorageClass",   { fg = c.yellow })
  hl("Structure",      { fg = c.yellow })
  hl("Typedef",        { fg = c.yellow })

  hl("Special",        { fg = c.cyan })
  hl("SpecialChar",    { fg = c.cyan })
  hl("Tag",            { fg = c.red })
  hl("Delimiter",      { fg = c.fg_dark })
  hl("SpecialComment", { fg = c.comment, italic = true })
  hl("Debug",          { fg = c.red })

  hl("Underlined",     { underline = true })
  hl("Ignore",         { fg = c.comment })
  hl("Error",          { fg = c.error })
  hl("Todo",           { fg = c.yellow, bold = true })

  --------------------------------------------------------------------------
  -- Diffs
  --------------------------------------------------------------------------
  hl("DiffAdd",        { fg = c.diff_add, bg = "#152722" })
  hl("DiffChange",     { fg = c.diff_change, bg = "#152126" })
  hl("DiffDelete",     { fg = c.diff_delete, bg = "#231618" })
  hl("DiffText",       { fg = c.fg, bg = c.diff_text })

  --------------------------------------------------------------------------
  -- Diagnostics / LSP
  --------------------------------------------------------------------------
  hl("DiagnosticError", { fg = c.error })
  hl("DiagnosticWarn",  { fg = c.warning })
  hl("DiagnosticInfo",  { fg = c.info })
  hl("DiagnosticHint",  { fg = c.hint })
  hl("DiagnosticOk",    { fg = c.ok })

  hl("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
  hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warning })
  hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.info })
  hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.hint })


  hl("LspReferenceText",  { bg = "#302231" })
  hl("LspReferenceRead",  { bg = "#302231" })
  hl("LspReferenceWrite", { bg = "#3a273c" })
  hl("LspSignatureActiveParameter", { fg = c.yellow, bold = true })
  hl("LspInlayHint",       { fg = c.comment, bg = bg_alt })

  --------------------------------------------------------------------------
  -- Treesitter 
  --------------------------------------------------------------------------
  hl("@comment",              { link = "Comment" })
  hl("@error",                { link = "Error" })

  hl("@variable",              { fg = c.red })
  hl("@variable.builtin",      { fg = c.red, italic = true })
  hl("@variable.parameter",    { fg = c.fg_dark })
  hl("@variable.member",       { fg = c.fg_dark })

  hl("@constant",              { fg = c.orange })
  hl("@constant.builtin",      { fg = c.yellow })
  hl("@constant.macro",        { fg = c.cyan })

  hl("@string",                { link = "String" })
  hl("@string.escape",         { fg = c.cyan })
  hl("@string.special",        { fg = c.cyan })
  hl("@character",             { link = "Character" })
  hl("@number",                { link = "Number" })
  hl("@boolean",               { link = "Boolean" })
  hl("@float",                 { link = "Float" })

  hl("@function",               { fg = c.blue })
  hl("@function.builtin",       { fg = c.blue, italic = true })
  hl("@function.macro",         { fg = c.cyan })
  hl("@function.method",        { fg = c.blue })
  hl("@constructor",            { fg = c.yellow })
  hl("@parameter",              { fg = c.fg_dark })

  hl("@keyword",                { fg = c.magenta })
  hl("@keyword.function",       { fg = c.magenta })
  hl("@keyword.operator",       { fg = c.magenta })
  hl("@keyword.return",         { fg = c.magenta })
  hl("@keyword.import",         { fg = c.blue })
  hl("@conditional",            { fg = c.magenta })
  hl("@repeat",                 { fg = c.magenta })
  hl("@exception",              { fg = c.magenta })

  hl("@type",                   { fg = c.yellow })
  hl("@type.builtin",           { fg = c.yellow, italic = true })
  hl("@type.definition",        { fg = c.yellow })
  hl("@attribute",              { fg = c.orange })
  hl("@namespace",              { fg = c.yellow })
  hl("@property",               { fg = c.fg_dark })
  hl("@field",                  { fg = c.fg_dark })

  hl("@punctuation.delimiter",  { fg = c.fg_dark })
  hl("@punctuation.bracket",    { fg = c.fg_dark })
  hl("@punctuation.special",    { fg = c.magenta })

  hl("@tag",                    { fg = c.red })
  hl("@tag.attribute",          { fg = c.orange })
  hl("@tag.delimiter",          { fg = c.fg_dark })

  hl("@markup.heading",         { fg = c.red, bold = true })
  hl("@markup.strong",          { fg = c.orange, bold = true })
  hl("@markup.italic",          { fg = c.magenta, italic = true })
  hl("@markup.link",            { fg = c.blue, underline = true })
  hl("@markup.raw",             { fg = c.green })
  hl("@markup.list",            { fg = c.magenta })

  hl("@module",                 { fg = c.yellow })
  hl("@label",                  { fg = c.magenta })

  --------------------------------------------------------------------------
  -- Popular plugins
  --------------------------------------------------------------------------

  -- gitsigns.nvim
  hl("GitSignsAdd",    { fg = c.diff_add })
  hl("GitSignsChange", { fg = c.diff_change })
  hl("GitSignsDelete", { fg = c.diff_delete })

  -- nvim-tree / neo-tree
  hl("NvimTreeNormal",        { fg = c.fg_dark, bg = bg_alt })
  hl("NvimTreeFolderIcon",    { fg = c.blue })
  hl("NvimTreeFolderName",    { fg = c.blue })
  hl("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
  hl("NvimTreeRootFolder",    { fg = c.yellow, bold = true })
  hl("NvimTreeIndentMarker",  { fg = "#404040" })
  hl("NvimTreeGitDirty",      { fg = c.diff_change })
  hl("NvimTreeGitNew",        { fg = c.diff_add })
  hl("NvimTreeGitDeleted",    { fg = c.diff_delete })
  hl("NeoTreeNormal",         { fg = c.fg_dark, bg = bg_alt })
  hl("NeoTreeDirectoryIcon",  { fg = c.blue })
  hl("NeoTreeDirectoryName",  { fg = c.blue })
  hl("NeoTreeRootName",       { fg = c.yellow, bold = true })

  -- telescope.nvim
  hl("TelescopeNormal",       { fg = c.fg_dark, bg = bg_alt })
  hl("TelescopeBorder",       { fg = c.bright_black, bg = bg_alt })
  hl("TelescopePromptNormal", { fg = c.fg, bg = bg_alt })
  hl("TelescopePromptBorder", { fg = c.bright_black, bg = bg_alt })
  hl("TelescopeSelection",    { bg = c.bg_highlight })
  hl("TelescopeMatching",     { fg = c.yellow, bold = true })

  -- nvim-cmp
  hl("CmpItemAbbr",             { fg = c.fg_dark })
  hl("CmpItemAbbrMatch",        { fg = c.blue, bold = true })
  hl("CmpItemAbbrMatchFuzzy",   { fg = c.blue, bold = true })
  hl("CmpItemKindFunction",     { fg = c.blue })
  hl("CmpItemKindVariable",     { fg = c.red })
  hl("CmpItemKindKeyword",      { fg = c.magenta })
  hl("CmpItemKindText",         { fg = c.fg_dark })
  hl("CmpItemKindSnippet",      { fg = c.cyan })

  -- indent-blankline.nvim (v3 uses IblIndent / IblScope)
  hl("IblIndent",     { fg = "#404040" })
  hl("IblScope",      { fg = "#707070" })
  hl("IndentBlanklineChar",       { fg = "#404040" })
  hl("IndentBlanklineContextChar",{ fg = "#707070" })

  -- which-key.nvim
  hl("WhichKey",          { fg = c.blue })
  hl("WhichKeyGroup",     { fg = c.magenta })
  hl("WhichKeyDesc",      { fg = c.fg_dark })
  hl("WhichKeySeparator", { fg = c.comment })
  hl("WhichKeyFloat",     { bg = bg_alt })

  -- bufferline.nvim
  hl("BufferLineIndicatorSelected", { fg = c.blue })
  hl("BufferLineFill",              { bg = bg_alt })

  -- snacks.nvim dashboard (LazyVim's default start screen)
  hl("SnacksDashboardHeader",  { fg = c.red, bold = true })
  hl("SnacksDashboardDesc",    { fg = c.fg_dark })
  hl("SnacksDashboardIcon",    { fg = c.green })
  hl("SnacksDashboardKey",     { fg = c.yellow })
  hl("SnacksDashboardFooter",  { fg = c.comment, italic = true })
  hl("SnacksDashboardTitle",   { fg = c.magenta, bold = true })

  -- alpha-nvim dashboard (older LazyVim / manual setups)
  hl("AlphaHeader",   { fg = c.blue, bold = true })
  hl("AlphaButtons",  { fg = c.fg_dark })
  hl("AlphaShortcut", { fg = c.orange })
  hl("AlphaFooter",   { fg = c.comment, italic = true })
end

return M