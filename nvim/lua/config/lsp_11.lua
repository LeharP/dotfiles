-- Configure Lua language server (lua_ls)
vim.lsp.config("lua_ls", { 
    cmd = { 'lua-language-server' }, 
    filetypes = { 'lua' },
    on_attach = on_attach,  -- Use on_attach function to set keymaps
}) 

vim.lsp.enable("lua_ls")


-- Step 3: Configure Ruff (Python Linter)
vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { { "pyproject.toml", "requirements.txt" }, ".git" },
})

vim.lsp.enable("ruff")

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },

    -- Correct root_markers: Just a flat list of markers
    root_markers = { "pyproject.toml", "requirements.txt", ".git" },

    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",  -- Options: "off", "basic", "strict"
                diagnosticMode = "workspace",  -- Options: "workspace", "openFilesOnly"
            },
            pythonPath = "python",  -- You can set the Python path if you need to use a specific environment
        },
    },
})

vim.lsp.enable("pyright")
--
-- vim.lsp.config("eslint", {
--     cmd = { "eslint", "--stdin", "--stdin-fd", "4", "--output-file", "/dev/stdout" },
--     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--     root_markers = { ".eslintrc", ".git", ".eslint.config.js" },  -- Marks root directories for ESLint
--     settings = {
--         eslint = {
--             enable = true,  -- Enable ESLint for supported filetypes
--             packageManager = "npm",  -- You can change this to "yarn" if you're using Yarn
--         },
--     },
-- })

-- vim.lsp.enable("eslint")

vim.lsp.config("tsserver", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "package.json", "tsconfig.json", ".git" },
})

vim.lsp.enable("tsserver")
