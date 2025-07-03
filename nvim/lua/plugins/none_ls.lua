return {
	"nvimtools/none-ls.nvim",
    dependencies ={
	    "nvimtools/none-ls-extras.nvim",
    },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				-- null_ls.builtins.formatting.ruff,
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.flake8"), -- requires none-ls-extras.nvim
                require("none-ls.diagnostics.ruff"),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
