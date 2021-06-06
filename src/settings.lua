local constants = require("constants")

data:extend{
  {
    type = "bool-setting",
    name = "bnl-enable",
    setting_type = "startup",
    default_value = true,
    order = "aa",
  },
  {
    type = "bool-setting",
    name = "bnl-glow",
    setting_type = "startup",
    default_value = true,
    order = "ab",
  },
  -- TODO:
  -- {
  --   type = "bool-setting",
  --   name = "bnl-show-on-mining-drills",
  --   setting_type = "startup",
  --   default_value = true,
  --   order = "ab",
  -- }
}

local color_settings = {}
for name, spec in pairs(constants.status_settings) do
  color_settings[#color_settings + 1] = {
    type = "string-setting",
    name = "bnl-color-"..name,
    localised_name = {"mod-setting-name.bnl-color-setting", {"mod-setting-name.bnl-status-"..name}},
    setting_type = "startup",
    default_value = spec.color,
    allowed_values = constants.color_settings,
    order = spec.order,
  }
end

data:extend(color_settings)
