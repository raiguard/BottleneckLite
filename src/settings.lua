local constants = require("constants")

data:extend{
  {
    type = "bool-setting",
    name = "bnl-enable",
    setting_type = "startup",
    default_value = true,
    order = "a",
  }
}

local status_settings = {}
for name, spec in pairs(constants.status_defaults) do
  status_settings[#status_settings + 1] = {
    type = "string-setting",
    name = "bnl-color-"..name,
    localised_name = {"mod-setting-name.bnl-color-setting", {"mod-setting-name.bnl-status-"..name}},
    setting_type = "startup",
    default_value = spec.color,
    allowed_values = constants.color_settings,
    order = spec.order,
  }
  status_settings[#status_settings + 1] = {
    type = "string-setting",
    name = "bnl-icon-"..name,
    localised_name = {"mod-setting-name.bnl-icon-setting", {"mod-setting-name.bnl-status-"..name}},
    setting_type = "startup",
    default_value = spec.icon,
    allowed_values = constants.icon_settings,
    order = spec.order,
  }
end

data:extend(status_settings)
