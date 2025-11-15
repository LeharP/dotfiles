-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		local conform = require("conform")
--
-- 		conform.setup({
-- 			formatters_by_ft = {
-- 				javascript = { "prettier" },
-- 				typescript = { "prettier" },
-- 				javascriptreact = { "prettier" },
-- 				typescriptreact = { "prettier" },
-- 				svelte = { "prettier" },
-- 				css = { "prettier" },
-- 				html = { "prettier" },
-- 				json = { "prettier" },
-- 				yaml = { "prettier" },
-- 				markdown = { "prettier" },
-- 				graphql = { "prettier" },
-- 				lua = { "stylua" },
-- 				python = { "isort", "black" },
-- 			},
--
-- 			-- 🔧 Formatter definitions
-- 			formatters = {
-- 				black = {
-- 					command = "black",
-- 					args = { "--quiet", "$FILENAME" },
-- 					stdin = false, -- ✅ Use file mode instead of stdin
-- 					timeout_ms = 8000, -- Give Black a bit more time
-- 				},
-- 				isort = {
-- 					command = "isort",
-- 					args = { "--quiet", "$FILENAME" },
-- 					stdin = false,
-- 				},
-- 			},
--
-- 			format_on_save = {
-- 				lsp_fallback = true,
-- 				async = false,
-- 				timeout_ms = 5000, -- increased to be safer for large files
-- 			},
-- 		})
--
-- 		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
-- 			conform.format({
-- 				lsp_fallback = true,
-- 				async = false,
-- 				timeout_ms = 5000,
-- 			})
-- 		end, { desc = "Format file or range (in visual mode)" })
-- 	end,
-- }
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
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
		vim.keymap.set({ "n", "v" }, "<leader>gf", vim.lsp.buf.format, {})
	end,
}
