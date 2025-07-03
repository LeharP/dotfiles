return {
    {
        "catppuccin/nvim",
        name = "catppuccin", -- This allows you to use 'catppuccin' as the plugin name
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Choose your Catppuccin flavour: latte, frappe, macchiato, mocha
                color_overrides = {
                    mocha = {
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
                transparent_background = true,
                custom_highlights = function(colors)
                return {
                Normal = { bg = "NONE" }, -- Set the background to black
                NormalFloat = { bg = "NONE" }, -- Optional: Float window background
                -- Specific plugin backgrounds
                -- NeoTreeNormal = { bg = "#000000" },
                -- NeoTreeNormalNC = { bg = "#000000" }, -- Non-current window
                -- TelescopeNormal = { bg = "#000000" },
                -- TelescopeBorder = { bg = "#000000" }, -- Border around Telescope
                -- TelescopePromptNormal = { bg = "#000000" },
                -- TelescopePromptBorder = { bg = "#000000" },
                -- TelescopeResultsNormal = { bg = "#000000" },
                -- TelescopeResultsBorder = { bg = "#000000" },
                -- TelescopePreviewNormal = { bg = "#000000" },
                -- TelescopePreviewBorder = { bg = "#000000" },
                }
                end,
                integrations = {
                    -- nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}


