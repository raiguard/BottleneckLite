local constants = require("__BottleneckLite__/constants")

data:extend({
  {
    type = "sprite",
    name = "bnl_solid_green",
    layers = {
      {
        filename = "__core__/graphics/empty.png",
        size = 1,
        scale = 64,
      },
      {
        filename = "__BottleneckLite__/graphics/solid.png",
        size = 64,
        scale = 0.5,
        offset = { 8, 8 },
        tint = constants.colors.solid.green,
        flags = { "icon" },
      },
    },
  },
  {
    type = "sprite",
    name = "bnl_default_green",
    filename = "__flib__/graphics/indicators.png",
    size = 32,
    y = 32,
    tint = constants.colors.default.green,
    flags = { "icon" },
  },
})
