return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
        local widgets = require("dap.ui.widgets")
		local dapui = require("dapui")

		dapui.setup()
		require("dap-python").setup("/Users/viktor/.virtualenvs/nvim/bin/python")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>dn", dap.step_over, {})
		vim.keymap.set("n", "<Leader>di", dap.step_into, {})
		vim.keymap.set("n", "<Leader>do", dap.step_out, {})

		vim.keymap.set({ "n", "v" }, "<Leader>dh", widgets.hover, {})
		vim.keymap.set({ "n", "v" }, "<Leader>dp", widgets.preview, {})
	end,
}
