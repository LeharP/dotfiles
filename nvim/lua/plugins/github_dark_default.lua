return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	config = function()
		-- Setup theme
		require("github-theme").setup({
			options = {
				transparent = true,
			},
		})

		-- Apply the colorscheme
		vim.cmd("colorscheme github_dark_default")
		-- Restore lualine background to black
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

		-- Delay highlight fix until all plugins/themes finish
		-- Force transparent Pmenu after everything loads
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.defer_fn(function()
					vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
					vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2c313a" })
					vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
					vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#3c4048" })
				end, 100) -- slight delay to override late theme changes
			end,
		})
	end,
}
