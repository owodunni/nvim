if vim.g.vscode then
  require("owodunni.vs-options")
else
  require("owodunni.options")
  require("owodunni.keymaps")
  require("owodunni.plugins")
end
