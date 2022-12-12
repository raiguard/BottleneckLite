local constants = {}

constants.additional_vertical_offset = 0.1

constants.colors = {
  default = {
    off = { a = 0 },
    blue = { r = 0.3, g = 0.3, b = 1 },
    cyan = { r = 0.3, g = 1, b = 1 },
    green = { r = 0.3, g = 1, b = 0.3 },
    orange = { r = 1, g = 0.5, b = 0.3 },
    purple = { r = 1, g = 0.3, b = 1 },
    red = { r = 1, g = 0.2, b = 0.2 },
    white = { r = 1, g = 1, b = 1 },
    yellow = { r = 1, g = 1, b = 0.3 },
  },
  solid = {
    off = { a = 0 },
    blue = { b = 1 },
    cyan = { g = 1, b = 1 },
    green = { g = 1 },
    orange = { r = 1, g = 0.5 },
    purple = { r = 1, b = 1 },
    red = { r = 1 },
    white = { r = 1, g = 1, b = 1 },
    yellow = { r = 1, g = 1 },
  },
}

local color_settings = {}
for name in pairs(constants.colors.default) do
  color_settings[#color_settings + 1] = name
end
constants.color_settings = color_settings

constants.default_size = "small"

constants.horizontal_position = 0.3

constants.ignored_entities = {
  -- Mining Drones
  ["mining-depot"] = true,
  -- Space Exploration
  ["se-core-miner"] = true,
  ["se-rocket-launch-pad-silo"] = true,
  -- Transport Drones
  ["fuel-depot"] = true,
  ["request-depot"] = true,
  ["supply-depot"] = true,
  ["buffer-depot"] = true,
}

constants.sizes = {
  small = 0.15,
  medium = 0.2,
  large = 0.25,
}

local size_settings = {}
for name in pairs(constants.sizes) do
  size_settings[#size_settings + 1] = name
end
constants.size_settings = size_settings

constants.status_settings = {
  disabled = { color = "red", order = "ca" },
  full_output = { color = "yellow", order = "cb" },
  idle = { color = "red", order = "cc" },
  insufficient_input = { color = "red", order = "cd" },
  low_power = { color = "yellow", order = "ce" },
  no_minable_resources = { color = "red", order = "cf" },
  no_power = { color = "red", order = "cg" },
  working = { color = "green", order = "ch" },
}

return constants
