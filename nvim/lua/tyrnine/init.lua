require("tyrnine.remap")
require("tyrnine.lazy")
print("Hello from TYRNINE")


vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.makeprg = "python3 %"
  end,
})

vim.cmd [[
  highlight StatusLine guifg=#9fa7df guibg=#000005 gui=bold
  highlight StatusLineNC guifg=#aaaaaa guibg=#303030 gui=italic
]]


-- vim.cmd.colorscheme("tokyonight-night")


