return {
	"mfussenegger/nvim-dap",
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
          -- stylua: ignore
            keys = {
                { "<leader>Du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
                { "<leader>De", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
            },
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
		"mfussenegger/nvim-dap-python",
	},

  -- stylua: ignore
  keys = {
    { "<leader>DB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>Dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>Da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>DC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>Dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>Di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>Dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>Dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>Dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>Do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>DO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>DP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>Dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>Ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>Dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>Dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

	config = function()
        
		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "", -- or "❌"
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapStopped", {
			text = "", -- or "→"
			texthl = "DiagnosticSignWarn",
			linehl = "Visual",
			numhl = "DiagnosticSignWarn",
		})

		local function get_venv_python()
			local venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return venv .. "/bin/python"
			else
				-- fallback to system python
				return "python3"
			end
		end

		local dap_python = require("dap-python")
		dap_python.setup(get_venv_python())
		-- load mason-nvim-dap here, after all adapters have been setup
		-- if LazyVim.has("mason-nvim-dap.nvim") then
		-- 	require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
		-- end

		-- vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
		--
		-- for name, sign in pairs(LazyVim.config.icons.dap) do
		-- 	sign = type(sign) == "table" and sign or { sign }
		-- 	vim.fn.sign_define(
		-- 		"Dap" .. name,
		-- 		{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
		-- 	)
		-- end
		--
		-- setup dap config by VsCode launch.json file
		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end
	end,
}
