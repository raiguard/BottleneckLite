local constants = {}

constants.additional_vertical_offset = 0.1

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
  huge = 0.5,
}

local size_settings = {}
for name in pairs(constants.sizes) do
  size_settings[#size_settings + 1] = name
end
constants.size_settings = size_settings

constants.status_settings = {
  disabled = { color = { r = 1 }, order = "ba" },
  full_output = { color = { r = 1, g = 1 }, order = "bb" },
  idle = { color = { r = 1 }, order = "bc" },
  insufficient_input = { color = { r = 1 }, order = "bd" },
  low_power = { color = { r = 1, g = 1 }, order = "be" },
  no_minable_resources = { color = { r = 1 }, order = "bf" },
  no_power = { color = { r = 1 }, order = "bg" },
  working = { color = { g = 1 }, order = "bh" },
}

return constants
