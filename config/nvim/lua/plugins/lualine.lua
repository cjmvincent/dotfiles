return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "command_center",
        icons_enabled = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename', 
            path = 2,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[Hello World]',
            }
          },
        },
        lualine_x = {
          {
            'filetype',
            icon_only = true,
          }
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename', 
            path = 2,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[Hello World]',
            }
          },
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      }
    })
  end,
}
  