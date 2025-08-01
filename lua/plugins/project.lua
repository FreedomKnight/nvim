return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/Documents/waltily*",
      "~/Documents/kkday*",
      "~/.config/nvim/",
    },
    picker = {
      type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
    }
  },
  keys = {
    { 
      "<leader>p",
      "<cmd>NeovimProjectDiscover<cr>",
      desc = "Discover projects",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim"},
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
