local status_ok, conform = pcall(require, "conform")
if not status_ok then
  print("Conform not found")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "eslint_d", "prettierd" } },
	},
	formatters_by_ft = {
		javascript = { { "eslint_d", "prettierd" } },
		typescript = { { "eslint_d", "prettierd" } },
		javascriptreact = { { "eslint_d", "prettierd" } },
		typescriptreact = { { "eslint_d", "prettierd" } },
		svelte = { { "eslint_d", "prettierd" } },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		graphql = { "prettierd" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},
})

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>l", "<cmd>Format<cr>", opts)

vim.keymap.set({ "n", "v" }, "<leader>l", function()
	print("Conform is formatting...")
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
