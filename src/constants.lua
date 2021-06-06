local constants = {}

constants.colors = {
  blue = {b = 1},
  green = {g = 1},
  purple = {r = 1, b = 1},
  red = {r = 1},
  teal = {g = 1, b = 1},
  white = {r = 1, g = 1, b = 1},
  yellow = {r = 1, g = 1},
}

-- TODO: Make a flib function for this usecase
local color_settings = {}
for name in pairs(constants.colors) do
  color_settings[#color_settings + 1] = name
end
constants.color_settings = color_settings

constants.icons = {
  off = "__BottleneckLite__/graphics/off.png", -- Show this as the first option
  alert = "__BottleneckLite__/graphics/alert.png",
  cross = "__BottleneckLite__/graphics/cross.png",
  minus = "__BottleneckLite__/graphics/minus.png",
  pause = "__BottleneckLite__/graphics/pause.png",
  solid = "__BottleneckLite__/graphics/solid.png",
  stop = "__BottleneckLite__/graphics/stop.png",
}

local icon_settings = {}
for name in pairs(constants.icons) do
  icon_settings[#icon_settings + 1] = name
end
constants.icon_settings = icon_settings

constants.status_defaults = {
  disabled = {
    color = "white",
    icon = "cross",
    order = "ba",
  },
  full_output = {
    color = "yellow",
    icon = "solid",
    order = "bb",
  },
  idle = {
    color = "yellow",
    icon = "pause",
    order = "bc",
  },
  insufficient_input = {
    color = "red",
    icon = "solid",
    order = "bd",
  },
  low_power = {
    color = "yellow",
    icon = "alert",
    order = "be",
  },
  no_minable_resources = {
    color = "red",
    icon = "cross",
    order = "bf",
  },
  no_power = {
    color = "red",
    icon = "alert",
    order = "bg",
  },
  working = {
    color = "green",
    icon = "solid",
    order = "bh",
  },
}

return constants
