local status_ok, conform = pcall(require, "conform")
if not status_ok then
  print("Conform not found")
	return
end

conform.setup({
	formatters_by_ft = {
		javascript = { "eslint", "prettierd", stop_after_first=true },
		typescript = { "eslint" },
		javascriptreact = { "eslint" },
		typescriptreact = { "eslint" },
		svelte = { "eslint" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		graphql = { "prettierd" },
		lua = { "stylua" },
		python = { "isort", "black", stop_after_first=true },
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
