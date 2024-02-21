local status_ok, animate = pcall(require, "mini.animate")
if not status_ok then
	return
end

animate.setup(
	-- No need to copy this inside `setup()`. Will be used automatically.
	{
		-- Cursor path
		cursor = {
			-- Whether to enable this animation
			enable = true,
		},

		-- Vertical scroll
		scroll = {
			-- Whether to enable this animation
			enable = false,
		},

		-- Window resize
		resize = {
			-- Whether to enable this animation
			enable = false,
		},

		-- Window open
		open = {
			-- Whether to enable this animation
			enable = false,
		},

		-- Window close
		close = {
			-- Whether to enable this animation
			enable = false,
		},
	}
)
