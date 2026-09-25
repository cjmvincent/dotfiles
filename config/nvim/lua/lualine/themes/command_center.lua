-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit itchyny, jackno (lightline)
-- stylua: ignore
local colors = {
  red	        = '#e96c75',
  lightred    = '#e06c75',
  green       = '#23d18b',
  lightgreen  = '#6bca78',
  yellow      = '#feff6e',
  lightyellow = '#feff6e',
  blue        = '#3b8eea',
  lightblue   = '#61afef',
  pink        = '#d670d6',
  lightpink   = '#d670d6',
  white       = '#f8f8f2',
  black       = '#282a36',
  lightgray   = '#666666',
  gray        = '#282a36',
}

return {
  normal = {
    a = { bg = NONE, fg = colors.blue, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
  insert = {
    a = { bg = NONE, fg = colors.green, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
  visual = {
    a = { bg = NONE, fg = colors.yellow, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
  replace = {
    a = { bg = NONE, fg = colors.red, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
  command = {
    a = { bg = NONE, fg = colors.red, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
  inactive = {
    a = { bg = NONE, fg = colors.gray, gui = "bold" },
    b = { bg = NONE, fg = colors.white },
    c = { bg = NONE, fg = colors.white },
  },
}
