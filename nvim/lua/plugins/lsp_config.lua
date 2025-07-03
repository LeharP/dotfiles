return{
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup{
                -- ensure_installed = {"lua_ls", "pyright","dockerls", "docker_compose_language_service"}
                auto_install = true,
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            -- local on_attach = function(client, bufnr)
            --     if client.name == 'ruff' then
            --         -- Disable hover in favor of Pyright
            --         client.server_capabilities.hoverProvider = false
            --     end
            -- end

            local lspconfig = require("lspconfig")
            -- lspconfig.ruff.setup {
            --     on_attach = on_attach,
            --     capabilities = capabilities
            -- }
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities
            })
            -- lspconfig.ruff.setup({
            --     capabilities = capabilities
            --     -- on_attach = on_attach
            -- })
            lspconfig.pyright.setup{
                capabilities = capabilities
            }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
