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
  alert = "__BottleneckLite__/graphics/alert.png",
  cross = "__BottleneckLite__/graphics/cross.png",
  minus = "__BottleneckLite__/graphics/minus.png",
  off = "__BottleneckLite__/graphics/off.png",
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
    order = "b",
  },
  full_output = {
    color = "yellow",
    icon = "solid",
    order = "c",
  },
  idle = {
    color = "yellow",
    icon = "pause",
    order = "d",
  },
  insufficient_input = {
    color = "green",
    icon = "solid",
    order = "e",
  },
  low_power = {
    color = "yellow",
    icon = "alert",
    order = "f",
  },
  no_minable_resources = {
    color = "red",
    icon = "cross",
    order = "g",
  },
  no_power = {
    color = "red",
    icon = "alert",
    order = "h",
  },
  working = {
    color = "green",
    icon = "solid",
    order = "i",
  },
}

return constants
