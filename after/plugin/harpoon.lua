
local status_ok, harpoon = pcall(require, "harpoon")
local status_mark_ok, mark = pcall(require, "harpoon.mark")
local status_ui_ok, ui = pcall(require, "harpoon.ui")
if not status_ok or not status_ui_ok or not status_ok then
  return
end

harpoon.setup({})

vim.keymap.set("n", "<leader>w", mark.add_file)
vim.keymap.set("n", "<leader>r", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_next() end)
vim.keymap.set("n", "<C-k>", function() ui.nav_prev() end)
