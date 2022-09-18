local default_schemas = nil
local status_ok, yamlls_settings = pcall(require, "nlspsettings.yamlls_settings")
if status_ok then
  default_schemas = yamlls_settings.get_default_schemas()
end

-- Find more schemas here: https://www.schemastore.org/json/
local schemas = {
  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
  ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml"
}

local function extend(tab1, tab2)
  for _, value in ipairs(tab2 or {}) do
    table.insert(tab1, value)
  end
  return tab1
end

local extended_schemas = extend(schemas, default_schemas)

local opts = {
  settings = {
    yaml = {
      schemas = extended_schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
