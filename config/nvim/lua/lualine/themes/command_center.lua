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
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
  command = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.gray, fg = colors.white },
  },
}