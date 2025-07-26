return {
  "catppuccin/nvim",
  name = "catppuccin", 
  proority = 1000,
  integrations = {
    coc_nvim = true,
    neotree = true,
    gitsigns = true,
    barbar = true,
    dap = true,
    dap_ui = true,
    indent_blankline = {
      enabled = true,
      scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      colored_indent_levels = false,
    },
  },
}
