require("tyrnine.remap")
require("tyrnine.lazy")
print("Hello from TYRNINE")

-- Set modifiable for all buffers
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",  -- Apply to all buffers
  command = "setlocal modifiable",  -- Make the buffer modifiable
})


-- vim.cmd.colorscheme("tokyonight-night")


