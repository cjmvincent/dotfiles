
vim.opt.termguicolors = true

if vim.g.colors_name then
  vim.cmd("hi clear")
end
vim.g.colors_name = "morphin-time"

-- Transparent by default. To turn it back off, put this in options.lua:
--   vim.g.morphin_time_transparent = false
require("morphin-time").setup({
  transparent = vim.g.morphin_time_transparent ~= false,
})