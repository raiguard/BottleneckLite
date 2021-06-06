local constants = require("constants")

-- Extract settings
local extracted_settings = {}
for name, spec in pairs(settings.startup) do
  local matched, _, type, key = string.find(name, "^bnl%-(.-)%-(.-)$")
  if matched then
    if not extracted_settings[key] then extracted_settings[key] = {} end
    extracted_settings[key][type] = spec.value
  end
end

local crafters = {
  "assembling-machine",
  "furnace",
  "rocket-silo"
}

for _, type in pairs(crafters) do
  for name, crafter in pairs(data.raw[type]) do
    local breakpoint
  end
end
