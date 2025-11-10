vim.lsp.config("lua_ls",{ 
    cmd = { 'lua-language-server'}, 
    filetypes = { 'lua'}, 
}) 

vim.lsp.enable("lua_ls")

-- vim.lsp.config("pyright",{ 
--     cmd = { 'pyright'}, 
--     filetypes = { 'py'}, 
-- }) 
--
-- vim.lsp.enable("pyright")
vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
})

vim.lsp.enable("pyright")

