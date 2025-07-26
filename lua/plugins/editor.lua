return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
    },
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'akinsho/bufferline.nvim',
    enabled = false, -- 目前不支援 tab 拖曳，但有斜邊 tab ，先用 barbar
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = "catppuccin",
    config = function ()
      require('bufferline').setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          mode = "buffers",
          themable = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          separator_style = 'slant',
          diagnostics = 'coc',
          indicator = {
            style =  'underline',
          },
        }
      }
      vim.keymap.set('n', '<A-,>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer left' })
      vim.keymap.set('n', '<A-.>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer right' })
    end
  },
  {
    'nvim-lualine/lualine.nvim', -- status bar
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = "catppuccin"
        }
      }
    end
  },
  {
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({
        mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
          '<C-u>', '<C-d>',
          '<C-b>', '<C-f>',
          '<C-y>', '<C-e>',
          'zt', 'zz', 'zb',
        },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        duration_multiplier = 1.0,   -- Global duration multiplier
        easing = 'linear',           -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        ignored_events = {           -- Events ignored while scrolling
            'WinScrolled', 'CursorMoved'
        },
      })
    end
  }
}
