local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "owodunni.lsp.configs"
require("owodunni.lsp.handlers").setup()
require "owodunni.lsp.conform"
