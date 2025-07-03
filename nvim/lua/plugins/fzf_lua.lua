return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    vim.keymap.set('n', '<leader>ff', "<cmd>FzfLua files<CR>"),
    vim.keymap.set('n', '<leader>fg', "<cmd>FzfLua live_grep<CR>"),
    vim.keymap.set('n', '<C-p>', "<cmd>FzfLua git_files<CR>", { desc = 'FzfLua git files' }),
    vim.keymap.set('n', '<leader>fb', "<cmd>FzfLua buffers<CR>", { desc = 'FzfLua buffers' }),
    vim.keymap.set('n', '<leader>fh', "<cmd>FzfLua help_tags<CR>", { desc = 'FzfLua help tags' }),

}
