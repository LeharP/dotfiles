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
				terminal_colors = true,
				hide_nc_statusline = true,
			},
			paletttes = {
				github_dark_default = {
					bg0 = NONE,
				},
			},
		})

		-- Apply the colorscheme
		vim.cmd("colorscheme github_dark_default")
		-- Restore lualine background to black
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1a1d23" })
	end,
}
