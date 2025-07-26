
return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>a', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
    require('telescope').setup{}
  end
}
