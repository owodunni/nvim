local servers = {
	"jsonls",
	"yamlls",
	"tsserver",
	"vuels",
	"svelte",
	"eslint",
	"tailwindcss",
	"bashls",
	"cssls",
	"gopls",
	"graphql",
	"rust_analyzer",
	"denols",
  "templ",
  "htmx",
  "html"
}

local settings = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"prettierd", -- prettier formatter
		"stylua", -- lua formatter
		"isort", -- python formatter
		"black", -- python formatter
		"pylint", -- python linter
		"eslint_d", -- js linter
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("owodunni.lsp.handlers").on_attach,
		capabilities = require("owodunni.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local has_custom_opts, server_custom_opts = pcall(require, "owodunni.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
