return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- event = { "VeryLazy" },
    -- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    -- init = function(plugin)
    --     -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    --     -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    --     -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    --     -- Luckily, the only things that those plugins need are the custom queries, which we make available
    --     -- during startup.
    --     require("lazy.core.loader").add_to_rtp(plugin)
    --     require("nvim-treesitter.query_predicates")
    -- end,
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = true,
            -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end}
