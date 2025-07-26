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
  }
}
