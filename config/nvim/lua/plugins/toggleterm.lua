return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()

    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- Shortcut to toggle terminal (Ctrl + \)
      hide_numbers = true,
      shade_terminals = true,
      direction = 'horizontal', -- Options: 'horizontal' | 'vertical' | 'tab' | 'float'
      close_on_exit = true,
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    })

    -- Add terminal-specific keymaps for easier navigation
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)     -- Escape terminal mode
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)        -- Quick escape
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) -- Move left
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts) -- Move down
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) -- Move up
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts) -- Move right
    end

    -- Trigger the keymaps when a terminal buffer opens
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
