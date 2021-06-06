local constants = {}

constants.status_defaults = {
  disabled = {
    color = {r = 1, g = 1, b = 1},
    icon = "solid",
  },
  full_output = {
    color = {r = 1, g = 1},
    icon = "solid",
  },
  idle = {
    color = {r = 1, g = 1},
    icon = "pause",
  },
  insufficient_input = {
    color = {g = 1},
    icon = "solid",
  },
  low_power = {
    color = {r = 1, g = 1},
    icon = "alert",
  },
  no_minable_resources = {
    color = {r = 1},
    icon = "cross",
  },
  no_power = {
    color = {r = 1},
    icon = "alert",
  },
  working = {
    color = {g = 1},
    icon = "solid",
  },
}

return constants
