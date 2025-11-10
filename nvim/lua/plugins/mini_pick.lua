return {
  'nvim-mini/mini.pick',
  version = '*',
  opts = {},
  config = function(_, opts)
    local pick = require('mini.pick')
    pick.setup(opts)

    -- vim.keymap.set('n', '<leader>ff', function() pick.builtin.files() end, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>ff', function()
      require('mini.pick').start({
        source = {
          name = 'Files (All)',
          cwd = vim.loop.cwd(),
          items = function()
          return vim.fn.systemlist(
              'rg --files --hidden --follow ' ..
              '--glob "!.venv/*" ' ..
              '--glob "!.git/*" ' ..
              '--glob "!node_modules/*"'
            )
          end,
        },
      })
    end, { desc = 'Find files including hidden' })
    vim.keymap.set('n', '<leader>fg', function() pick.builtin.grep_live() end, { desc = 'Live grep' })
    vim.keymap.set('n', '<C-p>',       function() pick.builtin.git_files() end, { desc = 'Git files' })
    vim.keymap.set('n', '<leader>fb', function() pick.builtin.buffers() end, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', function() pick.builtin.help() end, { desc = 'Help tags' })
  end,
}

