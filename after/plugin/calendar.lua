local calendar_status_ok, calendar = pcall(require, "calendar-vim")
if not calendar_status_ok then
  return
end
