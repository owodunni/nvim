local status_ok, jest = pcall(require, "nvim-jest")
if not status_ok then
	return
end

jest.setup {}
