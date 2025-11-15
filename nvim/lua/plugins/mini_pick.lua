return {
	"nvim-mini/mini.pick",
	version = "*",
	opts = {},
	config = function(_, opts)
		local pick = require("mini.pick")
		pick.setup(opts)

		vim.keymap.set("n", "<leader>ff", function()
			require("mini.pick").start({
				source = {
					name = "Files (fzf)",
					items = function()
						-- fd is better here, but fzf works too
						return vim.fn.systemlist(
							"fd --type f --hidden --follow --no-ignore " .. 
                            "--exclude .git --exclude .venv --exclude node_modules --exclude __pycache__"
						)
					end,
				},
			})
		end)
		vim.keymap.set("n", "<leader>fg", function()
			pick.builtin.grep_live()
		end, { desc = "Live grep" })
		vim.keymap.set("n", "<C-p>", function()
			pick.builtin.git_files()
		end, { desc = "Git files" })
		vim.keymap.set("n", "<leader>fb", function()
			pick.builtin.buffers()
		end, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", function()
			pick.builtin.help()
		end, { desc = "Help tags" })
	end,
}
